# UI/UX Specifications

## Navigation Model
Use a five-tab structure:
- Home
- Explore
- Stories
- Community
- Profile

## Home Screen
Contains:
- Hero card for “South Mumbai Through Time”
- Featured landmarks carousel
- Era-based collections
- Recent community activity snippets
- Continue exploring section for signed-in users

## Explore Screen
Contains:
- Full-screen map canvas
- Floating search bar
- Era selector pill bar
- Overlay opacity control
- Mini legend chip
- Bottom sheet for selected landmark
- Nearby landmarks chip rail

## Landmark Detail Sheet
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

## Stories Screen
Contains editorial cards that link to one or more landmarks, such as:
- “How the Bombay shoreline changed”
- “Colonial to contemporary streetscapes”
- “Landmarks lost, preserved, or transformed”

## Community Screen
Contains:
- Saved places
- Recent comments
- Live landmark rooms
- Personal activity feed

## Profile Screen
Contains:
- Avatar
- Display name
- Username
- Bio
- Favorite era
- Saved landmarks
- Contribution summary
- Sign out

## Design Language
- Glassmorphism UI: blurred, semi-transparent panels with vibrant accents over map.
- Dark museum-like neutral theme with elegant highlights and colorful gameified accents.
- Serif headline font for editorial modules; clean sans-serif for controls.
- Interactive map morph: smooth crossfade between eras with visual terrain morph.
- Micro-animations for era changes, sheet expansion, and reward celebrations.
- Distinct visual hierarchy between stories, map controls, and social features.

## UI Implementation Status (from Implementation Specs)
- Home Screen: 80% complete (missing era-based collections)
- Explore Screen: 70% complete (missing mini legend chip)
- Landmark Detail Sheet: 60% complete (missing what changed here cards, live presence capsule)
- Stories Screen: 50% complete (missing story detail view, map integration from stories)
- Community Screen: 40% complete (missing saved places view, live landmark rooms interface, personal activity feed)
- Profile Screen: 30% complete (missing profile editing, username/bio fields, favorite era selection, contribution summary stats)

## Accessibility Considerations
- Support for dynamic type (text scaling).
- VoiceOver labels and hints for interactive elements.
- Accessibility traits for buttons, toggles, etc.
- Color contrast compliance (WCAG AA).
- Reduced motion support for users who prefer minimal animation.