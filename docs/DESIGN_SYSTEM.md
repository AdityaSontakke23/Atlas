# Design System

## Theme
- Base: Dark, museum-like neutral theme (background: #121212, surface: #1E1E1E)
- Glassmorphism UI: semi-transparent frosted surfaces with background blur and subtle borders
- Elegant highlights for interactive elements (accent: #BB86FC, secondary: #03DAC6)
- Gameified accent colors for rewards/achievements (success: #4CAF50, warning: #FF9800, celebration: #FFD700)
- Light mode variant for accessibility (optional)

## Typography
- Headline (Serif): Intel, Playfair Display, or Georgia; weights: Regular 400, Medium 500, Bold 600
- Body (Sans-serif): SF Pro Text, Helvetica Neue, or Arial; weights: Regular 400, Medium 500
- Dynamic type support: Text styles adjust with user's preferred content size
- Text sizes: Caption (.85rem), Body (1rem), Subheading (1.25rem), Heading (1.5rem), Title (2rem)
- Line height: 1.4 for body, 1.2 for headings
- Letter tracking: -0.5px for headlines, normal for body

## Color Palette
### Neutrals
- Background: #121212
- Surface: #1E1E1E
- Surface Variant: #2A2A2A
- On Surface: #E0E0E0
- On Surface Variant: #B0B0B0

### Accents (Era Visualization)
- Primary: #BB86FC (Purple)
- Secondary: #03DAC6 (Teal)
- Tertiary: #CF6679 (Rose)
- Success: #4CAF50 (Green)
- Warning: #FF9800 (Orange)
- Error: #F44336 (Red)
- Celebration: #FFD700 (Gold)

### Glassmorphism
- Glass surface: rgba(255,255,255,0.08) with backdrop blur
- Glass border: 1px solid rgba(255,255,255,0.18)
- Glass shadow: 0 4px 6px rgba(0,0,0,0.1)

### Interactive States
- Pressed overlay: 20% darker
- Focus ring: 2px solid #BB86FC (2px, 60% opacity)
- Disabled: 30% opacity

## Spacing (8pt grid)
- xs: 4px
- sm: 8px
- md: 12px
- lg: 16px
- xl: 24px
- xxl: 32px
- xxxl: 48px

## Components
### Hero Cards
- Glassmorphism surface: rgba(255,255,255,0.08) with backdrop blur and 1px border rgba(255,255,255,0.18)
- Image overlay with gradient overlay (transparent to black 40%)
- Title: Serif, 1.5rem, white
- Subtitle: Sans-serif, 1rem, opacity 80%
- Padding: 16px
- Border radius: 16px

### Carousels
- Horizontal scrolling with momentum
- Item spacing: 12px
- Visible peek: 24px of next item
- Indicator: dots, 6px diameter, 8px spacing, active dot scaled 1.2x

### Pill Bars (Era Selector)
- Height: 32px
- Padding horizontal: 12px
- Border radius: 16px
- Background: glassmorphism surface (rgba(255,255,255,0.08), backdrop blur)
- Active background: primary
- Active text: on primary (white)
- Font: sans-serif medium, 0.9rem
- Margin: 4px vertical
- Border: 1px solid rgba(255,255,255,0.18)

### Opacity Sliders
- Track height: 4px
- Thumb size: 20x20px
- Track color: surface variant
- Thumb color: primary
- Value label: serif, 0.85rem, appears above thumb

### Legend Chips
- Height: 24px
- Padding horizontal: 8px
- Border radius: 12px
- Background: glassmorphism surface (rgba(255,255,255,0.08), backdrop blur)
- Text: sans-serif, 0.8rem
- Margin: 4px
- Border: 1px solid rgba(255,255,255,0.18)

### Bottom Sheets
- Handle bar: 4px width, 36px length, surface variant, radius 2px
- Top padding: 16px
- Horizontal padding: 20px
- Bottom padding: env(safe-area-inset-bottom) + 16px
- Background: surface
- Border radius: top 20px only

### Timeline Scrubber
- Track height: 6px
- Thumb: circle 18px diameter
- Track color: surface variant
- Thumb color: primary
- Tick marks: 2px height, opacity 40%
- Label: serif, 0.85rem, above track

### Then/Now Toggle
- Switch style: width 44px, height 24px
- Track: surface variant radius 12px
- Thumb: circle 20px diameter, primary color
- Label: sans-serif, 0.9rem

### Photo Carousels
- Same as generic carousel with zoom effect on center item (scale 1.05)
- Caption overlay: serif, 0.85rem, background rgba(0,0,0,0.5), padding 4px

### Presence Indicators
- Status dot: 8px diameter, colors: green (online), gray (offline), pulsing animation
- Tooltip: serif, 0.75rem, background surface, padding 6px, radius 6px
- Username: serif, 0.85rem

### Comment Threads
- Avatar: 32px radius 50%
- Message bubble: background surface variant, radius 16px, padding 12px
- Timestamp: sans-serif, 0.75rem, opacity 60%
- Reply indicator: vertical line 2px width, primary color, margin 4px

### Reaction Buttons
- Icon: 24x24px, tint on surface
- Tooltip on long press: serif, 0.75rem, background surface, padding 6px, radius 6px
- Count: sans-serif, 0.85rem, appears beside icon

### Save/Bookmark Controls
- Icon: bookmark outline/svg, 24px
- Filled state: primary color
- Tooltip: serif, 0.75rem

### Avatar Display
- Size: 40px, 56px, 80px variants
- Border: 2px solid surface variant
- Placeholder: serif initials, background surface variant, rounded

### Gameification Elements
- Achievement Badge: circular badge with icon, glassmorphism surface, colored border based on rarity
- Streak Counter: flame icon with number, pulsating animation on milestones
- Reward Popup: confetti animation, glassmorphism card with celebratory colors
- Progress Bar: segmented track with glassmorphism fill, celebratory animation on completion
- Level Display: serif typography with underline animation on level up

### Profile Editing Forms
- Input fields: height 44px, padding horizontal 12px, background surface variant, border 1px solid surface variant, radius 8px
- Label: serif, 0.85rem, margin bottom 4px
- Error text: serif, 0.75rem, error color
- Button: height 44px, background primary, radius 8px, text white sans-serif medium

## Motion & Interaction
- Micro-animations for era changes: fade overlay 200ms ease-in-out
- Sheet expansion: height animate 300ms spring (damping 20, stiffness 170)
- Loading states: skeleton shimmer animation 1.5s linear infinite
- Transition animations between views: slide horizontally 250ms ease-out
- Feedback for interactive states: pressed scale 0.95, focus ring as above
- Smooth map transitions when switching eras: crossfade overlays 300ms, map camera animate 400ms
- Haptic feedback: light impact for taps, medium for confirmation, error for failures
- Gameification animations:
  - Achievement unlock: scale pop 0.8->1.2->1.0 with confetti burst
  - Streak flame: pulse animation 1.1x scale on milestones
  - Level up: text shake + underline reveal + particle burst
  - Reward celebration: confetti cannon + glassmorphism card pop-in

## Accessibility
- Support for text scaling up to 200% without loss of content or functionality
- VoiceOver labels and hints for all interactive elements (buttons, toggles, sliders, etc.)
- Accessibility traits: button, header, image, adjustable (for sliders), etc.
- Color contrast compliance: minimum 4.5:1 for normal text, 3:1 for large text and UI components
- Reduced motion support: respect UIAccessibilityReduceMotion flag, disable non-essential animations
- Touch target minimum: 48x48px
- Ensure all content is accessible via VoiceOver rotor and navigation

## Implementation Notes
- Use SwiftUI's built-in Dynamic Type with custom fonts via UIFontMetrics
- Implement theme via EnvironmentObject or ObservableObject
- Utilize SF Symbols for icons where appropriate, with custom SVGs for brand-specific icons
- Implement glassmorphism using background blur (BlurView) and semi-transparent surfaces
- Leverage MapKit snapshot testing for map UI tests
- Centralize color and spacing constants in a Theme struct