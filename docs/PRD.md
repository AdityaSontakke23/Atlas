# Product Requirements Document (PRD)

## Problem Statement
Modern map apps answer “where” and “how to get there” but not “what existed here before,” “how did this place change,” or “why is this location historically significant.” Historical information is fragmented across archives, books, research papers, blogs, image collections, and government sources, making place-based historical discovery difficult, non-spatial, and unintuitive.

## MVP Problem Statement
No streamlined mobile application lets users interactively explore the historical evolution of a place inside a single map-driven experience using curated landmarks, time-based layers, archival imagery, and narrative context. TimeLens solves this for a focused region by delivering a historically rich, visually guided, and technically feasible iOS app.

## Objectives
### Primary
- Build a polished iOS MVP that explores historical change through maps.
- Support accounts and authentication for personalization and community features.
- Add small but meaningful realtime features.
- Create a modular architecture that can support future lenses.
- Use a curated content strategy for quality and feasibility.

### Secondary
- Demonstrate advanced SwiftUI architecture with a MapKit bridge.
- Use PostGIS for spatial queries.
- Use Supabase Storage for media and historical assets.
- Use Supabase Realtime for place presence and live comments.
- Build an interface that feels editorial and creative rather than only utilitarian.

## Product Vision
Atlas is not only a map. It is a place-understanding platform. Navigation apps answer where. Atlas answers why, when, how, and eventually what a place felt like in another era. Atlas should feel like a blend of:
- a historical atlas,
- a museum guide,
- a narrative city companion,
- and a modern location product.

## MVP Scope
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

## User Personas
1. **Curious Visitor** – traveler or city explorer who wants context beyond navigation.
2. **Student / Research Learner** – learner who wants concise historical understanding with visual comparison.
3. **Heritage Enthusiast** – user who actively seeks stories, archival imagery, and historical continuity.
4. **Community Explorer** – signed-in user who wants to save places, react, and read or post short comments.

## Functional Requirements
### Guest Features
- Browse Home and Stories.
- Explore public landmarks on the map.
- View public landmark details, timelines, and archival content.

### Authenticated Features
- Sign up and sign in.
- Edit profile.
- Upload avatar.
- Save/bookmark landmarks and stories.
- Post comments.
- Join live landmark room presence.
- Send quick reactions.

### Admin / Content Management Assumptions
Content curation is handled manually through Supabase tables, SQL scripts, CSV import, and storage uploads. No separate admin panel is required initially.

## Non-Functional Requirements
- Smooth map interaction on modern iPhones.
- Reasonable offline resilience through client-side caching of previously fetched data.
- Strong RLS-based data protection.
- Modular codebase.
- Fast first-load for non-map screens.
- Accessibility support for text scaling and VoiceOver labels where possible.

## Success Criteria for MVP
1. Users can authenticate and persist sessions.
2. Map displays with historical tile overlays for South Mumbai.
3. Users can browse landmarks, view details, and switch eras.
4. Users can read stories and navigate to related landmarks.
5. Authenticated users can save landmarks, comment, and react.
6. Real-time features show live presence and comment updates.
7. Basic accessibility support is implemented.
8. App performs acceptably on iPhone 12 and newer devices.
9. No critical bugs block core user flows.
10. Content provides meaningful historical exploration experience.