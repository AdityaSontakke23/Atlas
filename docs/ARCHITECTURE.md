# Technical Architecture

## High-Level Architecture
1. SwiftUI presentation layer.
2. MapKit bridge layer using `UIViewRepresentable`.
3. Feature and state layer using view models.
4. Service layer for Auth, Data, Storage, and Realtime.
5. Supabase backend with Postgres/PostGIS, Auth, Storage, and Realtime.

## Frontend Architecture
- Use MVVM with modular feature folders.
- Core ViewModels:
  - `AppViewModel`: auth session, onboarding state, root routing.
  - `HomeViewModel`: featured content and collections.
  - `ExploreViewModel`: map region, selected landmark, selected era, overlay alpha.
  - `LandmarkDetailViewModel`: eras, photos, comments, reactions.
  - `CommunityViewModel`: bookmarks, room presence, activity feed.
  - `ProfileViewModel`: profile editing, avatar upload, preferences.

## Map Bridge Architecture
- `MapKitBridgeView`: wraps `MKMapView`.
- `MapCoordinator`: `MKMapViewDelegate` implementation.
- `HistoricalTileOverlay`: subclass of `MKTileOverlay`.
- `MapOverlayFactory`: creates tile overlays per era.
- `LandmarkAnnotationFactory`: converts backend landmark records to annotation models.

## Backend Architecture
Supabase serves as the entire BaaS layer.
- Auth for accounts.
- Postgres/PostGIS for data.
- Storage for images and static tile assets if self-hosted.
- Realtime for presence and comments.

## Supabase Setup Blueprint
### Project Setup Steps
1. Create a new Supabase project.
2. Save the Project URL and publishable key.
3. Add `supabase-swift` to the Xcode project.
4. Configure redirect URLs for iOS deep links.
5. Create tables, indexes, and policies in SQL Editor.
6. Create storage buckets.
7. Enable and configure Realtime private channels.
8. Seed content for regions, landmarks, eras, and stories.

### Auth Configuration
- Recommended MVP auth methods: Email/password; Magic link / OTP as optional convenience.
- Deep Link Requirements:
  - Add a custom URL scheme in Xcode.
  - Add the same redirect URL in Supabase Auth settings.
  - Handle callback URLs in SwiftUI with `onOpenURL`.

### Storage Buckets
Recommended buckets:
- `avatars`
- `era-photos`
- `story-media`
- `historical-tiles` (optional; can also use object storage/CDN outside Supabase)

## Database Schema
See full SQL schema in Blueprint section 13.1.
Key tables: `profiles`, `regions`, `tile_sets`, `landmarks`, `landmark_eras`, `era_photos`, `stories`, `story_landmarks`, `bookmarks`, `comments`, `reactions`, `rooms`, `rooms_users`.
Extensions: `postgis`, `pgcrypto`.

### Recommended Indexes
- `idx_landmarks_region_id`, `idx_landmarks_coordinate` (gist)
- `idx_landmark_eras_landmark_id`
- `idx_era_photos_era_id`
- `idx_bookmarks_user_id`, `idx_bookmarks_landmark_id`
- `idx_comments_landmark_id`, `idx_comments_user_id`
- `idx_reactions_landmark_id`
- `idx_rooms_users_user_id`

### Useful Database Triggers
`set_updated_at` trigger on `profiles`, `landmarks`, `stories`, `comments`.

## Row Level Security Blueprint
Enable RLS on all exposed tables.
- Public read policies for anon/authenticated on most tables.
- User-specific insert/update/delete policies for profiles, bookmarks, comments, reactions, rooms_users.

## Storage Policy Blueprint
- `avatars`: authenticated uploads, public or authenticated reads.
- `era-photos`: read-only public historical assets.
- `story-media`: read-only public story assets.
- `historical-tiles`: read-only tile assets if hosted in Supabase.
Example avatar path pattern: `avatars/<user-id>/profile.jpg`.

## Realtime Blueprint
### Realtime Features for MVP
- Presence in landmark rooms.
- Live comment updates for currently open landmark.
- Live reaction count refresh.

### Room Model
Each landmark can have one room. When the user opens a landmark detail screen:
1. Fetch or derive the room slug.
2. Join the private realtime channel.
3. Upsert the user into `rooms_users`.
4. Track presence metadata such as username and current era.
5. Remove membership on exit if desired.

### Realtime Authorization Direction
Use private channels and a membership table. Access to a room should depend on the user being authenticated and allowed to join that room. For the MVP, all authenticated users may join public landmark rooms, but authorization should still go through private channels.

### Comment Updates
Use Postgres Changes or channel events to refresh comments when a new comment for the current landmark is inserted.

## Map and Geospatial Blueprint
### Why `MKMapView` and Not Native SwiftUI `Map`
Historical tile overlays require APIs and delegate behavior centered on MapKit’s overlay system. Therefore, the app should use `MKMapView` inside `UIViewRepresentable`.

### Historical Overlay Flow
1. User selects a landmark.
2. Landmark detail exposes available eras.
3. Selecting an era changes active tile set metadata.
4. The map bridge loads the corresponding `MKTileOverlay`.
5. Opacity slider adjusts overlay alpha.
6. Bounding map rect prevents excessive tile requests.

### Spatial Queries
Useful PostGIS query for nearby landmarks:
```sql
select id, name, slug
from public.landmarks
where st_dwithin(
  coordinate,
  st_setsrid(st_makepoint(:lng, :lat), 4326)::geography,
  :radius_meters
)
order by st_distance(
  coordinate,
  st_setsrid(st_makepoint(:lng, :lat), 4326)::geography
)
limit 20;
```

## SwiftUI App Structure
See Blueprint section 19 for full tree:
```
Atlas/
├── App/
│   ├── AtlasApp.swift
│   ├── AppRouter.swift
│   ├── RootView.swift
│   └── DeepLinkHandler.swift
├── Core/
│   ├── Theme/
│   ├── Components/
│   ├── Extensions/
│   ├── Utilities/
│   └── Constants/
├── Models/
│   ├── Profile.swift
│   ├── Region.swift
│   ├── Landmark.swift
│   ├── LandmarkEra.swift
│   ├── EraPhoto.swift
│   ├── TileSet.swift
│   ├── Story.swift
│   ├── Bookmark.swift
│   ├── Comment.swift
│   ├── Reaction.swift
│   └── Room.swift
├── Services/
│   ├── SupabaseClientProvider.swift
│   ├── AuthService.swift
│   ├── ProfileService.swift
│   ├── LandmarkService.swift
│   ├── StoryService.swift
│   ├── BookmarkService.swift
│   ├── CommentService.swift
│   ├── ReactionService.swift
│   ├── RealtimeService.swift
│   ├── StorageService.swift
│   └── RegionService.swift
├── Map/
│   ├── MapKitBridgeView.swift
│   ├── MapCoordinator.swift
│   ├── HistoricalTileOverlay.swift
│   ├── OverlayRendererFactory.swift
│   ├── LandmarkAnnotation.swift
│   └── MapStateStore.swift
├── Features/
│   ├── Auth/
│   │   ├── AuthView.swift
│   │   ├── SignInView.swift
│   │   ├── SignUpView.swift
│   │   └── AuthViewModel.swift
│   ├── Home/
│   ├── Explore/
│   ├── LandmarkDetail/
│   ├── Stories/
│   ├── Community/
│   ├── Profile/
│   └── Bookmarks/
�└── Resources/
    ├── Assets.xcassets
    └── PreviewData/
```

## Feature-by-Feature API Use
### Auth APIs
Use Supabase Swift auth methods for: sign up, sign in with password, sign in with OTP / magic link, sign out, session restoration, auth state change listening, deep-link session completion.

### Data Access APIs
Use `supabase.from(...).select()/insert()/update()/delete()` for profiles, bookmarks, comments, reactions, landmarks, and stories.

### Storage APIs
Use storage uploads/downloads for avatars and public URLs or downloads for media.

### Realtime APIs
Use channel subscription, presence tracking, and database change feeds for room activity.

### MapKit APIs
Use: `MKMapView`, `MKPointAnnotation`, `MKTileOverlay`, `MKTileOverlayRenderer`, `MKMapViewDelegate`, visible region / camera APIs.

## Supabase Implementation Checklist
### Database
- Create extensions.
- Create all tables.
- Add indexes.
- Add update triggers.
- Enable RLS.
- Create policies.
- Seed base records.

### Auth
- Enable email/password.
- Configure magic link if used.
- Add redirect URL.
- Test session persistence.

### Storage
- Create buckets.
- Configure bucket public/private mode.
- Add object policies.
- Upload seed images.

### Realtime
- Enable Realtime on needed tables if using Postgres Changes.
- Configure private channels.
- Validate authenticated access.

### Client
- Add project URL and publishable key.
- Create a singleton or provider for `SupabaseClient`.
- Build auth state observer.
- Build services by feature.