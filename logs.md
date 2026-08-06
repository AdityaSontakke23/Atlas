# Change Log

## 2026-08-06 11:00
- Created SupabaseSecrets.swift.template in Atlas/Services/ to hold placeholder Supabase credentials.
- Modified SupabaseClientProvider.swift to read credentials from SupabaseSecrets.swift (or environment variables as fallback) and removed hardcoded values.
- Created .gitignore to exclude SupabaseSecrets.swift, .env files, Xcode derived data, and other common exclusions.
- Created this logs.md file to document changes.

## 2026-08-06 11:05
- Updated PRD.md to include interactive map morph/dial visualization and gameified UI elements (achievements, streaks, rewards) in MVP scope.
- Updated UX.md to reflect glassmorphism UI, map morph transitions, and gameification design language.
- Updated DESIGN_SYSTEM.md to add glassmorphism styles, gameification components, and morph animation definitions.
- Updated IMPLEMENTATION_GUIDE.md to include map morph/dial visualization and historical API integration tasks in Phase 2.
- Updated TEST_SPEC.md to add unit and integration tests for gameification logic, historical API integration, and map morph visualization; added manual testing for glassmorphism and gameification features.
- Updated RELEASE_SPEC.md to update app description, screenshots, and post-release tasks to reflect new features.

## 2026-08-06 11:10
- Created SupabaseSecrets.swift in Atlas/Services/ with placeholder values for Supabase URL and anon key.
- This file is ignored by git via .gitignore to prevent committing credentials.