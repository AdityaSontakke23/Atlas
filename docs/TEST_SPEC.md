# Testing Strategy

## Unit / Logic Testing
- Auth state transitions (sign up, sign in, sign out, token refresh)
- Bookmark toggling logic (add/remove, landmark/story)
- Reaction toggling logic (add/remove, unique constraint per type)
- View-model state transitions (loading, success, error, empty)
- Map coordinate transformations (world to screen, region calculations)
- Service layer API calls (mock Supabase client, verify correct endpoints)
- Model decoding/encoding (Codable conformance, default values)
- Persistence layer (UserDefaults settings, if any)
- Utility functions (date formatting, distance calculations)

## Integration Testing
- Login and session restore flow (deep link handling, persistence)
- Profile update and avatar upload (storage upload, DB update)
- Landmark detail fetch and era switching (multiple API calls, state sync)
- Comment insert and live update (realtime subscription, UI update)
- Reaction insert and live update (count aggregation, realtime)
- Presence join/leave (room membership, broadcast)
- Map bounds checking (tile overlay requests limited to bounds)
- Deep link handling (auth callback, routing to appropriate screen)
- Story detail navigation (tap story, view landmarks, map integration)
- Saved places flow (bookmark persistence, retrieval, deletion)

## Manual Testing
- Era switching with overlay transitions (smooth crossfade, correct tile set)
- Overlay opacity control (slider updates overlay alpha)
- Deep-link auth callback handling (universal links, custom scheme)
- Presence indicator behavior (dot appearance, tooltip, updates)
- RLS verification with anon vs authenticated users (public vs private data)
- Accessibility (VoiceOver navigation, dynamic type scaling, color contrast)
- Performance (map tile loading, frame rate, launch time)
- Offline behavior (cached data visibility, error states for missing data)
- Edge cases (empty states, malformed data, network failure)
- Localization (if future added, ensure strings externalized)
- Push notifications (if implemented, permission and handling)

## Automated Testing Infrastructure
- Unit tests using XCTest, run on every PR
- UI tests using XCTest for critical flows (login, landmark detail, comment)
- Snapshot testing for UI components (FBSnapshotTestView or SwiftUI Preview)
- Network mocking with Mocker or SwiftSyntax for Supabase calls
- Continuous integration (GitHub Actions) to run tests on push/pull request
- Code coverage target: 80%+ for unit tests

## Test Data & Seeding
- Factory pattern for generating test model instances
- Seeded test database with known landmarks, eras, stories
- Use Supabase emulator or mock service for deterministic tests
- Test user accounts with predefined roles (anon, authenticated, admin)

## Acceptance Criteria
All tests must pass on CI before merge.
Manual test checklist signed off by QA lead.
Performance benchmarks: map tile load < 200ms, app launch < 2s, memory < 150MB.
Accessibility audit passes WCAG AA for critical screens.