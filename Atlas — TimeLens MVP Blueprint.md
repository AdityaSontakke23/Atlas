# Atlas — TimeLens MVP Blueprint

## Academic Project Document

**Project Title:** Atlas  
**Version 1 Lens:** TimeLens  
**Platform:** iOS (SwiftUI + MapKit bridge)  
**Backend:** Supabase  
**Primary Region for MVP:** South Mumbai  
**Document Purpose:** Full product, system, and implementation blueprint for the MVP.

---

## 1. Abstract

Atlas is a location-intelligence platform designed to help users explore places through contextual lenses rather than only through navigation. The first lens, TimeLens, focuses on historical exploration and allows users to understand how a place evolved across time through map overlays, timelines, archival photographs, curated stories, and lightweight community interaction. The MVP targets a curated region such as South Mumbai and combines SwiftUI, MapKit, Supabase Auth, Postgres/PostGIS, Storage, and Realtime into a modular architecture that can later expand into ArchitectureLens, CultureLens, and other future lenses.

---

## 2. Problem Statement

Modern map applications are excellent at answering “where” and “how do I get there,” but they rarely answer “what existed here before,” “how did this place change,” or “why is this location historically significant.” Historical information about a place is usually fragmented across museum archives, books, research papers, blogs, image collections, and government sources. This makes place-based historical discovery difficult, non-spatial, and unintuitive.

The gap is especially clear in cities with layered urban history. A user may stand in front of a landmark and know its location, but still have no natural way to compare present-day reality with past urban forms, older shoreline conditions, vanished buildings, or major architectural changes. Atlas addresses this gap by turning mapping into spatial storytelling.

### MVP Problem Statement

There is no streamlined mobile application that lets users interactively explore the historical evolution of a place inside a single map-driven experience using curated landmarks, time-based layers, archival imagery, and narrative context. TimeLens solves this for a focused region by delivering a historically rich, visually guided, and technically feasible iOS app.

---

## 3. Objectives

### Primary Objectives
- Build a polished iOS MVP that explores historical change through maps.
- Support accounts and authentication for personalization and community features.
- Add small but meaningful realtime features.
- Create a modular architecture that can support future lenses.
- Use a curated content strategy for quality and feasibility.

### Secondary Objectives
- Demonstrate advanced SwiftUI architecture with a MapKit bridge.
- Use PostGIS for spatial queries.
- Use Supabase Storage for media and historical assets.
- Use Supabase Realtime for place presence and live comments.
- Build an interface that feels editorial and creative rather than only utilitarian.

---

## 4. Research Summary

### 4.1 Map Rendering Research
- Historical raster overlays are feasible in MapKit using `MKTileOverlay` and `MKTileOverlayRenderer`.
- The historical layer should not replace the base map. It should be drawn above it with opacity control.
- SwiftUI’s native `Map` is not sufficient for this requirement, so the correct implementation path is to wrap `MKMapView` in `UIViewRepresentable`.
- Bounding the overlay region is important because MapKit otherwise requests tiles outside intended coverage.
- True map morphing or geometric warping is not practical for the MVP using native MapKit.

### 4.2 Data and Archival Research
- Public-domain or open historical maps can be sourced from Wikimedia Commons and similar archival collections.
- Historical map images should be georeferenced in QGIS and exported to Web Mercator-compatible tiles.
- A curated South Mumbai tile set with selected eras is more practical than citywide coverage.

### 4.3 Backend Research
- Supabase Swift supports Auth, session handling, database access, storage uploads/downloads, and realtime subscriptions.
- Row Level Security is essential on exposed tables.
- Realtime authorization can be enforced using private channels and membership checks.
- Storage access can be secured with policies on `storage.objects`.

---

## 5. Product Vision

Atlas is not only a map. It is a place-understanding platform. Navigation apps answer where. Atlas answers why, when, how, and eventually what a place felt like in another era.

### Product Positioning
Atlas should feel like a blend of:
- a historical atlas,
- a museum guide,
- a narrative city companion,
- and a modern location product.

---

## 6. MVP Scope

### In Scope
- Curated historical region: South Mumbai.
- 12 to 20 curated landmarks.
- Landmark map discovery.
- Historical tile overlays for selected eras.
- Timelines and era selection.
- Historical photographs and captions.
- Curated stories.
- User authentication and accounts.
- Saved places.
- Realtime presence in landmark rooms.
- Realtime comments and quick reactions.

### Out of Scope
- Full city reconstruction.
- AI-generated history.
- Full social network features.
- Advanced 3D reconstruction.
- True map morphing.
- User-submitted archival moderation pipeline in V1.
- ArchitectureLens, CultureLens, EnvironmentLens, and other future lenses.

---

## 7. User Personas

### 7.1 Curious Visitor
A traveler or city explorer who wants context beyond navigation.

### 7.2 Student / Research Learner
A learner who wants concise historical understanding with visual comparison.

### 7.3 Heritage Enthusiast
A user who actively seeks stories, archival imagery, and historical continuity.

### 7.4 Community Explorer
A signed-in user who wants to save places, react, and read or post short comments.

---

## 8. Functional Requirements

### 8.1 Guest Features
- Browse Home and Stories.
- Explore public landmarks on the map.
- View public landmark details, timelines, and archival content.

### 8.2 Authenticated Features
- Sign up and sign in.
- Edit profile.
- Upload avatar.
- Save/bookmark landmarks and stories.
- Post comments.
- Join live landmark room presence.
- Send quick reactions.

### 8.3 Admin / Content Management Assumptions
For the MVP, content curation is handled manually through Supabase tables, SQL scripts, CSV import, and storage uploads. No separate admin panel is required initially.

---

## 9. Non-Functional Requirements

- Smooth map interaction on modern iPhones.
- Reasonable offline resilience through client-side caching of previously fetched data.
- Strong RLS-based data protection.
- Modular codebase.
- Fast first-load for non-map screens.
- Accessibility support for text scaling and VoiceOver labels where possible.

---

## 10. UI and UX Blueprint

The UI should not feel like a single map with buttons. It should be a layered, editorial product.

### 10.1 Navigation Model
Use a five-tab structure:
- Home
- Explore
- Stories
- Community
- Profile

### 10.2 Home Screen
Contains:
- Hero card for “South Mumbai Through Time”
- Featured landmarks carousel
- Era-based collections
- Recent community activity snippets
- Continue exploring section for signed-in users

### 10.3 Explore Screen
Contains:
- Full-screen map canvas
- Floating search bar
- Era selector pill bar
- Overlay opacity control
- Mini legend chip
- Bottom sheet for selected landmark
- Nearby landmarks chip rail

### 10.4 Landmark Detail Sheet
Contains:
- Hero image / era card
- One-paragraph summary
- Timeline scrubber
- Then/Now toggle
- Historical photo carousel
- What changed here cards
- Related stories
- Live presence capsule
- Comments section
- Save and react actions

### 10.5 Stories Screen
Contains editorial cards that link to one or more landmarks, such as:
- “How the Bombay shoreline changed”
- “Colonial to contemporary streetscapes”
- “Landmarks lost, preserved, or transformed”

### 10.6 Community Screen
Contains:
- Saved places
- Recent comments
- Live landmark rooms
- Personal activity feed

### 10.7 Profile Screen
Contains:
- Avatar
- Display name
- Username
- Bio
- Favorite era
- Saved landmarks
- Contribution summary
- Sign out

### 10.8 Design Language
- Dark, museum-like neutral theme with elegant highlights.
- Serif headline font for editorial modules and clean sans-serif for controls.
- Frosted or translucent control surfaces over the map.
- Micro-animations for era changes and sheet expansion.
- Distinct visual hierarchy between stories, map controls, and social features.

---

## 11. System Architecture

### 11.1 High-Level Architecture
1. SwiftUI presentation layer.
2. MapKit bridge layer using `UIViewRepresentable`.
3. Feature and state layer using view models.
4. Service layer for Auth, Data, Storage, and Realtime.
5. Supabase backend with Postgres/PostGIS, Auth, Storage, and Realtime.

### 11.2 Frontend Architecture
Use MVVM with modular feature folders.

#### Core ViewModels
- `AppViewModel`: auth session, onboarding state, root routing.
- `HomeViewModel`: featured content and collections.
- `ExploreViewModel`: map region, selected landmark, selected era, overlay alpha.
- `LandmarkDetailViewModel`: eras, photos, comments, reactions.
- `CommunityViewModel`: bookmarks, room presence, activity feed.
- `ProfileViewModel`: profile editing, avatar upload, preferences.

### 11.3 Map Bridge Architecture
The map subsystem should be isolated from general SwiftUI screens.

#### Key Components
- `MapKitBridgeView`: wraps `MKMapView`.
- `MapCoordinator`: `MKMapViewDelegate` implementation.
- `HistoricalTileOverlay`: subclass of `MKTileOverlay`.
- `MapOverlayFactory`: creates tile overlays per era.
- `LandmarkAnnotationFactory`: converts backend landmark records to annotation models.

### 11.4 Backend Architecture
Supabase serves as the entire BaaS layer.
- Auth for accounts.
- Postgres/PostGIS for data.
- Storage for images and static tile assets if self-hosted.
- Realtime for presence and comments.

---

## 12. Supabase Setup Blueprint

### 12.1 Project Setup Steps
1. Create a new Supabase project.
2. Save the Project URL and publishable key.
3. Add `supabase-swift` to the Xcode project.
4. Configure redirect URLs for iOS deep links.
5. Create tables, indexes, and policies in SQL Editor.
6. Create storage buckets.
7. Enable and configure Realtime private channels.
8. Seed content for regions, landmarks, eras, and stories.

### 12.2 Auth Configuration
Recommended MVP auth methods:
- Email/password.
- Magic link / OTP as optional convenience.

#### Deep Link Requirements
- Add a custom URL scheme in Xcode.
- Add the same redirect URL in Supabase Auth settings.
- Handle callback URLs in SwiftUI with `onOpenURL`.

### 12.3 Storage Buckets
Recommended buckets:
- `avatars`
- `era-photos`
- `story-media`
- `historical-tiles` (optional; can also use object storage/CDN outside Supabase)

---

## 13. Database Schema

### 13.1 SQL Schema
```sql
create extension if not exists postgis;
create extension if not exists pgcrypto;

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  username text unique,
  display_name text,
  bio text,
  avatar_path text,
  hometown text,
  current_city text,
  favorite_era text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.regions (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  name text not null,
  summary text,
  default_center geography(point, 4326) not null,
  bounding_box geometry(polygon, 4326),
  created_at timestamptz not null default now()
);

create table public.tile_sets (
  id uuid primary key default gen_random_uuid(),
  region_id uuid references public.regions(id) on delete cascade,
  label text not null,
  year_start int,
  year_end int,
  tile_url_template text not null,
  min_zoom int not null default 12,
  max_zoom int not null default 17,
  bounds_sw geography(point, 4326),
  bounds_ne geography(point, 4326),
  attribution text,
  source_name text,
  created_at timestamptz not null default now()
);

create table public.landmarks (
  id uuid primary key default gen_random_uuid(),
  region_id uuid references public.regions(id) on delete cascade,
  slug text unique not null,
  name text not null,
  subtitle text,
  summary text,
  present_description text,
  hero_image_path text,
  coordinate geography(point, 4326) not null,
  tags text[] default '{}',
  is_featured boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.landmark_eras (
  id uuid primary key default gen_random_uuid(),
  landmark_id uuid references public.landmarks(id) on delete cascade,
  tile_set_id uuid references public.tile_sets(id) on delete set null,
  era_label text not null,
  year_start int,
  year_end int,
  narrative text,
  short_fact text,
  cover_image_path text,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

create table public.era_photos (
  id uuid primary key default gen_random_uuid(),
  era_id uuid references public.landmark_eras(id) on delete cascade,
  storage_path text not null,
  caption text,
  source_credit text,
  license_note text,
  year_taken int,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

create table public.stories (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  title text not null,
  summary text,
  body text not null,
  hero_image_path text,
  region_id uuid references public.regions(id) on delete set null,
  is_published boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.story_landmarks (
  story_id uuid references public.stories(id) on delete cascade,
  landmark_id uuid references public.landmarks(id) on delete cascade,
  primary key (story_id, landmark_id)
);

create table public.bookmarks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  landmark_id uuid references public.landmarks(id) on delete cascade,
  story_id uuid references public.stories(id) on delete cascade,
  created_at timestamptz not null default now(),
  constraint bookmarks_target_check check (
    (landmark_id is not null and story_id is null)
    or (landmark_id is null and story_id is not null)
  )
);

create table public.comments (
  id uuid primary key default gen_random_uuid(),
  landmark_id uuid not null references public.landmarks(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  body text not null check (char_length(body) between 1 and 500),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz
);

create table public.reactions (
  id uuid primary key default gen_random_uuid(),
  landmark_id uuid not null references public.landmarks(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  reaction_type text not null check (reaction_type in ('surprised','beautiful','curious','want_to_visit')),
  created_at timestamptz not null default now(),
  unique (landmark_id, user_id, reaction_type)
);

create table public.rooms (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  landmark_id uuid unique references public.landmarks(id) on delete cascade,
  created_at timestamptz not null default now()
);

create table public.rooms_users (
  room_id uuid not null references public.rooms(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  joined_at timestamptz not null default now(),
  primary key (room_id, user_id)
);
```

### 13.2 Recommended Indexes
```sql
create index idx_landmarks_region_id on public.landmarks(region_id);
create index idx_landmarks_coordinate on public.landmarks using gist(coordinate);
create index idx_landmark_eras_landmark_id on public.landmark_eras(landmark_id);
create index idx_era_photos_era_id on public.era_photos(era_id);
create index idx_bookmarks_user_id on public.bookmarks(user_id);
create index idx_bookmarks_landmark_id on public.bookmarks(landmark_id);
create index idx_comments_landmark_id on public.comments(landmark_id);
create index idx_comments_user_id on public.comments(user_id);
create index idx_reactions_landmark_id on public.reactions(landmark_id);
create index idx_rooms_users_user_id on public.rooms_users(user_id);
```

### 13.3 Useful Database Triggers
```sql
create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create trigger set_profiles_updated_at
before update on public.profiles
for each row execute function public.set_updated_at();

create trigger set_landmarks_updated_at
before update on public.landmarks
for each row execute function public.set_updated_at();

create trigger set_stories_updated_at
before update on public.stories
for each row execute function public.set_updated_at();

create trigger set_comments_updated_at
before update on public.comments
for each row execute function public.set_updated_at();
```

---

## 14. Row Level Security Blueprint

Enable RLS on all exposed tables.

```sql
alter table public.profiles enable row level security;
alter table public.regions enable row level security;
alter table public.tile_sets enable row level security;
alter table public.landmarks enable row level security;
alter table public.landmark_eras enable row level security;
alter table public.era_photos enable row level security;
alter table public.stories enable row level security;
alter table public.story_landmarks enable row level security;
alter table public.bookmarks enable row level security;
alter table public.comments enable row level security;
alter table public.reactions enable row level security;
alter table public.rooms enable row level security;
alter table public.rooms_users enable row level security;
```

### 14.1 Public Read Policies
```sql
create policy "public read profiles" on public.profiles for select to anon, authenticated using (true);
create policy "public read regions" on public.regions for select to anon, authenticated using (true);
create policy "public read tiles" on public.tile_sets for select to anon, authenticated using (true);
create policy "public read landmarks" on public.landmarks for select to anon, authenticated using (true);
create policy "public read landmark eras" on public.landmark_eras for select to anon, authenticated using (true);
create policy "public read era photos" on public.era_photos for select to anon, authenticated using (true);
create policy "public read stories" on public.stories for select to anon, authenticated using (is_published = true);
create policy "public read story landmarks" on public.story_landmarks for select to anon, authenticated using (true);
create policy "public read rooms" on public.rooms for select to authenticated using (true);
```

### 14.2 Profiles Policies
```sql
create policy "users insert own profile" on public.profiles for insert to authenticated with check ((select auth.uid()) = id);
create policy "users update own profile" on public.profiles for update to authenticated using ((select auth.uid()) = id) with check ((select auth.uid()) = id);
```

### 14.3 Bookmarks Policies
```sql
create policy "users read own bookmarks" on public.bookmarks for select to authenticated using ((select auth.uid()) = user_id);
create policy "users insert own bookmarks" on public.bookmarks for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "users delete own bookmarks" on public.bookmarks for delete to authenticated using ((select auth.uid()) = user_id);
```

### 14.4 Comments Policies
```sql
create policy "public read non deleted comments" on public.comments for select to anon, authenticated using (deleted_at is null);
create policy "users insert own comments" on public.comments for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "users update own comments" on public.comments for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "users soft delete own comments" on public.comments for delete to authenticated using ((select auth.uid()) = user_id);
```

### 14.5 Reactions Policies
```sql
create policy "public read reactions" on public.reactions for select to anon, authenticated using (true);
create policy "users insert own reactions" on public.reactions for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "users delete own reactions" on public.reactions for delete to authenticated using ((select auth.uid()) = user_id);
```

### 14.6 Room Membership Policies
```sql
create policy "users read own room memberships" on public.rooms_users for select to authenticated using ((select auth.uid()) = user_id);
create policy "users join own memberships" on public.rooms_users for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "users leave own memberships" on public.rooms_users for delete to authenticated using ((select auth.uid()) = user_id);
```

---

## 15. Storage Policy Blueprint

### 15.1 Buckets
- `avatars`: authenticated uploads, public or authenticated reads depending on preference.
- `era-photos`: read-only public historical assets.
- `story-media`: read-only public story assets.
- `historical-tiles`: read-only tile assets if hosted in Supabase.

### 15.2 Example Storage Policies
```sql
insert into storage.buckets (id, name, public) values ('avatars', 'avatars', false) on conflict (id) do nothing;
insert into storage.buckets (id, name, public) values ('era-photos', 'era-photos', true) on conflict (id) do nothing;

create policy "avatar read own or public profile usage" on storage.objects for select to authenticated using (bucket_id = 'avatars');
create policy "avatar upload own folder" on storage.objects for insert to authenticated with check (bucket_id = 'avatars' and (storage.foldername(name)) = (select auth.uid())::text);[1]
create policy "avatar update own folder" on storage.objects for update to authenticated using (bucket_id = 'avatars' and (storage.foldername(name)) = (select auth.uid())::text) with check (bucket_id = 'avatars' and (storage.foldername(name)) = (select auth.uid())::text);[1]
create policy "avatar delete own folder" on storage.objects for delete to authenticated using (bucket_id = 'avatars' and (storage.foldername(name)) = (select auth.uid())::text);[1]
```

Recommended avatar path pattern:
```text
avatars/<user-id>/profile.jpg
```

---

## 16. Realtime Blueprint

### 16.1 Realtime Features for MVP
- Presence in landmark rooms.
- Live comment updates for currently open landmark.
- Live reaction count refresh.

### 16.2 Room Model
Each landmark can have one room. When the user opens a landmark detail screen:
1. Fetch or derive the room slug.
2. Join the private realtime channel.
3. Upsert the user into `rooms_users`.
4. Track presence metadata such as username and current era.
5. Remove membership on exit if desired.

### 16.3 Realtime Authorization Direction
Use private channels and a membership table. Access to a room should depend on the user being authenticated and allowed to join that room. For the MVP, all authenticated users may join public landmark rooms, but authorization should still go through private channels so the structure remains production-minded.

### 16.4 Comment Updates
Use Postgres Changes or channel events to refresh comments when a new comment for the current landmark is inserted.

---

## 17. Map and Geospatial Blueprint

### 17.1 Why `MKMapView` and Not Native SwiftUI `Map`
Historical tile overlays require APIs and delegate behavior centered on MapKit’s overlay system. Therefore, the app should use `MKMapView` inside `UIViewRepresentable`.

### 17.2 Historical Overlay Flow
1. User selects a landmark.
2. Landmark detail exposes available eras.
3. Selecting an era changes active tile set metadata.
4. The map bridge loads the corresponding `MKTileOverlay`.
5. Opacity slider adjusts overlay alpha.
6. Bounding map rect prevents excessive tile requests.

### 17.3 Spatial Queries
Useful PostGIS queries:

#### Nearby landmarks
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

---

## 18. Historical Data Pipeline

### 18.1 Source Acquisition
Possible sources:
- Public-domain maps from Wikimedia Commons.
- Historical archival collections.
- Curated photos with verified licensing and attribution.

### 18.2 Georeferencing Workflow
1. Download high-resolution map image.
2. Open in QGIS.
3. Mark control points against modern basemap references.
4. Export georeferenced raster in Web Mercator-compatible workflow.
5. Slice tiles using MapTiler Desktop or `gdal2tiles`.
6. Upload generated tiles.
7. Insert metadata into `tile_sets`.

### 18.3 Content Curation Workflow
1. Choose landmarks.
2. Write concise summaries.
3. Prepare 2 to 5 era entries per landmark.
4. Attach images and source credits.
5. Seed related stories.

---

## 19. SwiftUI App Structure

```text
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
└── Resources/
    ├── Assets.xcassets
    └── PreviewData/
```

---

## 20. Feature-by-Feature API Use

### 20.1 Auth APIs
Use Supabase Swift auth methods for: sign up, sign in with password, sign in with OTP / magic link, sign out, session restoration, auth state change listening, deep-link session completion.

### 20.2 Data Access APIs
Use `supabase.from(...).select()/insert()/update()/delete()` for profiles, bookmarks, comments, reactions, landmarks, and stories.

### 20.3 Storage APIs
Use storage uploads/downloads for avatars and public URLs or downloads for media.

### 20.4 Realtime APIs
Use channel subscription, presence tracking, and database change feeds for room activity.

### 20.5 MapKit APIs
Use: `MKMapView`, `MKPointAnnotation`, `MKTileOverlay`, `MKTileOverlayRenderer`, `MKMapViewDelegate`, visible region / camera APIs.

---

## 21. Supabase Implementation Checklist

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

---

## 22. Suggested Swift Models

Example model directions:
- `Profile`: Codable user-facing profile data.
- `Landmark`: point coordinate plus display fields.
- `LandmarkEra`: narrative and tile linkage.
- `Comment`: text, user relation, timestamps.
- `Reaction`: small enum-backed interaction record.

Coordinate fields may need custom decoding if returned through RPC or transformed view models.

---

## 23. Recommended RPC / SQL Functions

### 23.1 Nearby Landmarks RPC
A stored function can simplify client code and centralize spatial filtering.

```sql
create or replace function public.get_nearby_landmarks(
  in_lat double precision,
  in_lng double precision,
  in_radius_meters integer default 1500,
  in_limit integer default 20
)
returns table (
  id uuid,
  slug text,
  name text,
  subtitle text,
  distance_meters double precision
)
language sql
stable
as $$
  select
    l.id,
    l.slug,
    l.name,
    l.subtitle,
    st_distance(
      l.coordinate,
      st_setsrid(st_makepoint(in_lng, in_lat), 4326)::geography
    ) as distance_meters
  from public.landmarks l
  where st_dwithin(
    l.coordinate,
    st_setsrid(st_makepoint(in_lng, in_lat), 4326)::geography,
    in_radius_meters
  )
  order by distance_meters
  limit in_limit;
$$;
```

---

## 24. App Flow Diagram (Textual)

```text
Launch App
  -> Check auth session
      -> Not signed in -> Auth flow
      -> Signed in -> Main tab shell

Home -> collection tap -> landmark or story
Explore -> map pin tap -> detail sheet -> join room -> load comments/reactions
Stories -> story tap -> linked landmarks -> open map/detail
Community -> bookmarks/activity -> reopen landmarks
Profile -> edit profile -> upload avatar -> save preferences
```

---

## 25. Example Supabase Service Responsibilities

- `AuthService`: sign in, sign up, sign out, session changes.
- `ProfileService`: load/update profile, upload avatar.
- `LandmarkService`: fetch regions, landmarks, era details, nearby data.
- `StoryService`: fetch published stories and related landmarks.
- `CommentService`: load/post/edit/delete comments.
- `ReactionService`: toggle reactions and aggregate counts.
- `RealtimeService`: join room, track presence, subscribe to comment/reaction changes.

---

## 26. Engineering Risks and Mitigations

### Risk 1: Map Overlay Complexity
Mitigation: isolate all overlay logic in the Map bridge and limit tile coverage.

### Risk 2: Historical Data Quality
Mitigation: choose fewer landmarks, verify sources manually, and require attribution fields.

### Risk 3: Performance of RLS Queries
Mitigation: add indexes, use explicit filters, and keep public content tables simple.

### Risk 4: Realtime Complexity
Mitigation: keep realtime limited to presence, comments, and reactions rather than collaborative editing.

### Risk 5: Scope Expansion
Mitigation: treat future lenses as roadmap items and freeze the TimeLens MVP scope.

---

## 27. Development Roadmap

### Phase 1: Foundation
- Create project.
- Add Supabase Swift.
- Configure Auth.
- Build root routing.
- Create profile flow.

### Phase 2: Content and Map Core
- Create schemas.
- Seed South Mumbai region.
- Build map bridge.
- Add landmark annotations.
- Add historical overlay loading.

### Phase 3: TimeLens Experience
- Build timeline selector.
- Add landmark detail sheets.
- Add archival photo carousel.
- Add story cards.

### Phase 4: Community and Realtime
- Bookmarks.
- Comments.
- Reactions.
- Presence capsules.

### Phase 5: Polish
- Animations.
- Error states.
- Accessibility pass.
- Performance pass.
- Documentation.

---

## 28. Testing Strategy

### Unit / Logic Testing
- Auth state transitions.
- Bookmark toggling.
- Reaction toggling.
- View-model state transitions.

### Integration Testing
- Login and session restore.
- Profile update and avatar upload.
- Landmark detail fetch.
- Comment insert and live update.

### Manual Testing
- Era switching.
- Overlay opacity.
- Deep-link auth callback.
- Presence indicator behavior.
- RLS verification with anon and authenticated users.

---

## 29. Academic Value

This project demonstrates:
- geospatial product design,
- mobile architecture in SwiftUI,
- UIKit bridging for platform limitations,
- backend-as-a-service integration,
- security through RLS,
- realtime system design,
- and thoughtful scoping for an applied, research-backed MVP.

---

## 30. Final Architecture Recommendation

The best MVP architecture for Atlas is:
- SwiftUI for overall app structure and rich interface,
- `MKMapView` via `UIViewRepresentable` for historical map overlays,
- Supabase Auth for accounts,
- Postgres/PostGIS for place and timeline data,
- Storage for avatars and archival media,
- Realtime for live comments, reactions, and presence,
- and a carefully curated South Mumbai dataset to keep the experience deep, credible, and achievable.

This structure solves the technical constraint identified in research, supports a strong academic demonstration, and leaves a clean path for future Lenses.