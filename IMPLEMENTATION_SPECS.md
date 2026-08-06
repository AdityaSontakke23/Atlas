# Atlas TimeLens MVP - Implementation Specifications

Based on the blueprint documents and codebase analysis, here are the implementation specifications for completing the Atlas TimeLens MVP.

## 1. Core Architecture Status � ✅ (Mostly Complete)

### What's Working:
- **App Entry Points**: AtlasApp.swift, AppRouter.swift, RootView.swift, DeepLinkHandler.swift
- **MVVM Architecture**: ViewModels for Home, Explore, LandmarkDetail, Community, Profile, Stories, Auth
- **Data Models**: All models match the Supabase schema from the blueprint
- **Services Layer**: Service classes for Auth, Profile, Landmark, Story, Comment, Reaction, Realtime, Storage, Region
- **Map Components**: MapKitBridgeView, HistoricalTileOverlay, MapCoordinator, etc.

### Areas Needing Completion:
- **AuthService**: Needs completion of deep link handling and session management
- **ProfileService**: Needs avatar upload implementation
- **StoryService**: Missing methods for fetching story landmarks and related content
- **CommentService**: Needs implementation for real-time updates and soft deletes
- **ReactionService**: Needs aggregation and real-time updates
- **RealtimeService**: Needs presence tracking and room membership implementation
- **StorageService**: Needs avatar upload/download and media handling

## 2. Feature Completion Specifications

### Home Screen (80% Complete)
**Requirements from Blueprint**:
- [x] Hero card for “South Mumbai Through Time”
- [x] Featured landmarks carousel
- [ ] Era-based collections
- [x] Recent community activity snippets
- [x] Continue exploring section for signed-in users

**Missing**: Era-based collections implementation

### Explore Screen (70% Complete)
**Requirements from Blueprint**:
- [x] Full-screen map canvas
- [x] Floating search bar
- [x] Era selector pill bar
- [x] Overlay opacity control
- [ ] Mini legend chip
- [x] Bottom sheet for selected landmark
- [x] Nearby landmarks chip rail

**Missing**: Mini legend chip implementation

### Landmark Detail Sheet (60% Complete)
**Requirements from Blueprint**:
- [x] Hero image / era card
- [x] One-paragraph summary
- [x] Timeline scrubber (basic implementation)
- [x] Then/Now toggle
- [x] Historical photo carousel
- [ ] What changed here cards
- [x] Related stories
- [ ] Live presence capsule
- [x] Comments section
- [x] Save and react actions

**Missing**: 
- What changed here cards (comparative UI)
- Live presence capsule (real-time integration)

### Stories Screen (50% Complete)
**Requirements from Blueprint**:
- [x] Editorial cards linking to landmarks
- [ ] Story detail view with linked landmarks
- [ ] Map integration from stories

**Missing**: 
- Story detail view
- Map integration when tapping landmarks from stories

### Community Screen (40% Complete)
**Requirements from Blueprint**:
- [ ] Saved places view
- [x] Recent comments
- [ ] Live landmark rooms
- [ ] Personal activity feed

**Missing**:
- Saved places grid/list view
- Live landmark rooms interface
- Personal activity feed

### Profile Screen (30% Complete)
**Requirements from Blueprint**:
- [x] Avatar display
- [ ] Display name
- [ ] Username
- [ ] Bio
- [ ] Favorite era
- [x] Saved landmarks
- [ ] Contribution summary
- [x] Sign out

**Missing**:
- Profile editing functionality
- Username and bio fields
- Favorite era selection
- Contribution summary stats

## 3. Backend & Supabase Implementation Specifications

### Database Schema � ✅ (Complete)
All tables from blueprint SQL schema appear to be modeled correctly in Swift.

### Row Level Security �� ⚠��️ (Needs Implementation)
RLS policies need to be applied in Supabase dashboard:
- [ ] Enable RLS on all tables
- [ ] Implement public read policies
- [ ] Implement user-specific policies for profiles, bookmarks, comments, reactions, rooms
- [ ] Implement storage policies for avatars, era-photos, story-media, historical-tiles

### Realtime Implementation �� ⚠��️ (Needs Work)
- [ ] Presence tracking in landmark rooms
- [ ] Live comment updates
- [ ] Live reaction count refresh
- [ ] Room membership management

### Storage Buckets �� ⚠��️ (Needs Setup)
- [ ] Create `avatars` bucket (private)
- [ ] Create `era-photos` bucket (public)
- [ ] Create `story-media` bucket (public)
- [ ] Create `historical-tiles` bucket (public, optional)
- [ ] Implement storage policies for each bucket

## 4. Map Functionality Specifications

### Historical Tile Overlay (70% Complete)
**Requirements from Blueprint**:
- [x] MKTileOverlay implementation with Web Mercator tiles
- [ ] Bounding map rect to prevent excessive tile requests
- [x] Opacity slider control
- [x] Loading tile sets per era
- [ ] Error handling for missing tiles
- [ ] Attribution display

**Missing**:
- Proper bounds checking for tile requests
- Error handling and fallback UI
- Attribution display per tile set

### Map Performance Optimization �� ⚠��️ (Needs Work)
- [ ] Tile request limiting based on visible region
- [ ] Caching strategy for frequently accessed tiles
- [ ] Memory management for tile overlays
- [ ] Smooth transitions between eras

## 5. Authentication Flow Specifications (60% Complete)

### Auth Service Requirements:
- [x] Email/password sign up and sign in
- [ ] Magic link / OTP implementation
- [x] Session restoration on app launch
- [x] Deep link handling for auth callbacks
- [ ] Email verification flow
- [ ] Password reset functionality
- [ ] Session persistence and refresh token handling

## 6. Offline & Caching Specifications (Not Started)
- [ ] Client-side caching of previously fetched landmark data
- [ ] Caching of recently viewed eras and photos
- [ ] Offline map tile caching (limited to viewed areas)
- [ ] Graceful degradation when offline

## 7. Accessibility Specifications (Not Started)
- [ ] Dynamic type support for all text
- [ ] VoiceOver labels and hints
- [ ] Accessibility traits for interactive elements
- [ ] Color contrast compliance
- [ ] Reduced motion support

## 8. Testing Strategy Specifications (Not Started)

### Unit Tests Needed:
- [ ] Auth state transitions
- [ ] Bookmark toggling logic
- [ ] Reaction toggling logic
- [ ] View-model state transitions
- [ ] Map coordinate transformations
- [ ] Service layer API calls

### Integration Tests Needed:
- [ ] Login and session restore flow
- [ ] Profile update and avatar upload
- [ ] Landmark detail fetch and era switching
- [ ] Comment insert and live update
- [ ] Deep link handling

### Manual Tests Needed:
- [ ] Era switching with overlay transitions
- [ ] Overlay opacity control
- [ ] Deep-link auth callback handling
- [ ] Presence indicator behavior
- [ ] RLS verification with anon vs authenticated users

## 9. Polish & Performance Specifications (Not Started)

### Animations & Micro-interactions:
- [ ] Micro-animations for era changes
- [ ] Sheet expansion animations
- [ ] Loading states and skeletons
- [ ] Error state animations
- [ ] Transition animations between views

### Performance Optimizations:
- [ ] Image loading optimization (SDWebImage or similar)
- [ ] List view performance for large datasets
- [ ] Map tile request throttling
- [ ] Debounced search input
- [ ] Efficient data fetching patterns

### Error Handling:
- [ ] Network error states with retry
- [ ] Empty state handling
- [ ] Validation error display
- [ ] Graceful degradation for missing data

## 10. Content & Data Specifications

### South Mumbai Dataset (Not Started):
- [ ] Curate 12-20 landmarks with historical significance
- [ ] Create 2-5 era entries per landmark
- [ ] Source and georeference historical map images
- [ ] Generate Web Mercator tiles for each era
- [ ] Collect historical photographs with proper attribution
- [ ] Write concise summaries and narratives
- [ ] Create curated stories linking multiple landmarks

### Content Implementation:
- [ ] Seed regions table with South Mumbai data
- [ ] Populate landmarks table with curated places
- [ ] Insert landmark_eras with temporal data
- [ ] Add era_photos with captions and credits
- [ ] Insert stories with hero images and body content
- [ ] Create story_landmark relationships

## Implementation Priority Order

### Phase 1: Core Functionality (Next 2 Weeks)
1. Complete AuthService with full email/password flow
2. Implement ProfileService avatar upload/download
3. Finish CommentService with real-time updates
4. Complete ReactionService with aggregation
5. Implement RealtimeService for presence and rooms
6. Finish StorageService for all media types
7. Add missing UI components (legend chip, what-changed cards, etc.)

### Phase 2: Map & Data Integration (Weeks 3-4)
1. Implement proper map bounds checking
2. Add attribution display for tile sets
3. Optimize tile request performance
4. Seed initial South Mumbai dataset
5. Implement era-based collections on Home screen
6. Complete story detail view and map integration

### Phase 3: Social & Polish (Weeks 5-6)
1. Implement saved places view in Community
2. Add personal activity feed
3. Implement profile editing functionality
4. Add accessibility support
5. Implement error states and loading UI
6. Add animations and micro-interactions
7. Performance optimization passes

### Phase 4: Offline & Final Testing (Weeks 7-8)
1. Implement client-side caching
2. Add offline map tile caching
3. Complete manual testing checklist
4. Write unit and integration tests
5. App Store preparation materials
6. Performance benchmarking and optimization

## Success Criteria for MVP

The MVP will be considered complete when:
1. Users can authenticate and persist sessions
2. Map displays with historical tile overlays for South Mumbai
3. Users can browse landmarks, view details, and switch eras
4. Users can read stories and navigate to related landmarks
5. Authenticated users can save landmarks, comment, and react
6. Real-time features show live presence and comment updates
7. Basic accessibility support is implemented
8. App performs acceptably on iPhone 12 and newer devices
9. No critical bugs block core user flows
10. Content provides meaningful historical exploration experience
