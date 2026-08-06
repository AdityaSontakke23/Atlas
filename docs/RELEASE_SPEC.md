# App Store Release Guide

## Preparation
- Complete all development phases (Core Functionality, Map & Data Integration, Social & Polish, Offline & Final Testing).
- Ensure app meets Apple's App Store Review Guidelines (safety, performance, business, design, legal).
- Test on iPhone 12+ devices (iOS 16.0+) for performance, battery usage, and responsiveness.
- Verify accessibility support (Dynamic Type, VoiceOver, color contrast, reduced motion).
- Confirm no critical bugs block core user flows (auth, map, landmark detail, comments, reactions).
- Perform privacy review: data collection limited to auth, location (optional), user-generated content; no inappropriate data usage.
- Prepare App Store privacy questionnaire responses.

## Metadata
- App Name: Atlas
- Subtitle: Explore History Through Maps
- Category: Travel, Reference (Primary: Travel)
- Keywords: historical exploration, maps, time travel, South Mumbai, heritage, landmarks, stories, culture, education
- Description: 
  Atlas is a location-intelligence platform that helps users explore places through contextual lenses. The first lens, TimeLens, lets users interactively explore the historical evolution of South Mumbai via map overlays, timelines, archival photographs, curated stories, and lightweight community interaction. Discover how a place changed over time with era-based tile overlays and smooth morph transitions, view historical photographs, read curated narratives, earn achievements and streaks for exploration, and engage with other explorers in realtime.
- Promotional Text: Explore places through time
- Support URL: https://github.com/AdityaSontakke23/Atlas (or project website)
- Marketing URL: https://github.com/AdityaSontakke23/Atlas
- Privacy Policy URL: To be hosted (e.g., GitHub Pages)
- License: MIT or proprietary (as per project)

## Screenshots & App Preview
Required screenshots (1242x2688 or 1125x2436 for iPhone 16.5.5):
1. Home Screen – hero card, featured carousel, era collections, glassmorphism panels.
2. Explore Screen – map with opacity control, era selector, landmark bottom sheet, map morph slider.
3. Landmark Detail Sheet – hero image, timeline scrubber, then/n toggle, photo carousel, comments, glassmorphism surfaces.
4. Stories Screen – editorial cards, tap to view story, glassmorphism cards.
5. Community Screen – saved places grid, recent comments, live rooms.
6. Profile Screen – avatar, profile info, saved landmarks, sign out, achievement badges, streak counter.
7. Gameification Screen – achievement gallery, streak calendar, reward history, level progression.
App preview video (15-30 seconds) showcasing era switching with map morph, comment live update, achievement unlocking, and map exploration.

## Build Settings
- Version: 1.0.0
- Build Number: 1 (increment for each submission)
- Deployment Target: iOS 16.0+
- Supported Devices: iPhone 8+ (optimized for iPhone 12+)
- Supported Orientations: Portrait (landscape optional but not required)
- Swift Language Version: Swift 6
- Integrate Supabase Swift SDK via Swift Package Manager.
- Link MapKit, Foundation, UIKit (for UIViewRepresentable).
- Enable App Sandbox, Hardened Runtime, and Library Validation (default).
- Use LaunchScreen.storyboard or SwiftUI LaunchScreen.
- Set app icon (1024x1024) with rounded corners (Apple provides mask).
- Enable Background Modes: Location (if using background location, not in MVP), Audio (not used), Background fetch (optional for caching).
- Enable Push Notifications capability (if using APNs for realtime, but using Supabase Realtime via websockets, not required).
- Privacy: Location set to "While Using the App" (if optional location search, not core); otherwise "None".
- Note: Glassmorphism effects use SwiftUI's built-in blur and transparency; no additional frameworks required.

## Submission Process
1. Increment version and build number.
2. Archive the app in Xcode (Product -> Archive).
3. Validate archive, resolve any warnings/errors.
4. Upload to App Store Connect via Xcode or Transporter.
5. Fill in metadata, upload screenshots, preview video.
6. Select export compliance (uses encryption? Supabase uses HTTPS, exempt).
7. Add review notes: test account credentials if needed, demo video link.
8. Submit for review.
9. Set release date: manual (recommended) to coordinate with marketing.

## Post-Release Tasks
- Monitor crash logs via Xcode Organizer or third-party (Firebase Crashlytics if added).
- Gather user feedback via App Store reviews, surveys, or social media.
- Track engagement metrics: DAU/WAU, feature usage (map interactions, comment posts, saves, achievement unlocks, streak maintenance).
- Monitor historical API usage and response times for supplemental data.
- Plan content updates: add more landmarks, eras, stories based on user interest.
- Plan for future lenses: ArchitectureLens, CultureLens, EnvironmentLens (separate updates).
- Respond to App Store reviews promptly.
- Implement A/B testing for UI changes (if using Firebase or custom).
- Update privacy policy if data practices change.
- Renew certificates and provisioning profiles as needed.
- Keep Supabase SDK updated for security patches.

## Versioning Policy
- Major (X.0.0): breaking changes, new lenses, major UI overhaul.
- Minor (X.Y.0): new features, significant improvements, content packs.
- Patch (X.Y.Z): bug fixes, performance improvements, minor tweaks.
- Follow semantic versioning.

## App Store Optimization (ASO)
- Title includes primary keyword "Atlas" and subtitle with "Explore History Through Maps".
- Keywords field: 100 characters, comma-separated, no spaces (e.g., historical exploration,maps,time travel,South Mumbai,heritage,landmarks,stories,culture,education).
- Encourage users to leave ratings and reviews via non-intrusive prompt after meaningful interactions.
- Localize metadata for target regions (English primary, consider Hindi/Marathi for South Mumbai audience).
- Regularly update screenshots with new features.