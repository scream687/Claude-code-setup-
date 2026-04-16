---
name: frontend-design
description: Enforces exact design standards for all UI — colors, spacing, typography, layout, dark mode, and component patterns. Apply whenever building any UI component, page, or visual element.
user-invocable: true
---

When building ANY UI for this project, apply these standards exactly.

## Brand Colors
- Primary: #FF6B35 (Electric Coral)
- Primary Light: #FF8F6B (gradients)
- Primary Soft: #FFB088 (gradient endpoints)
- Teal accent: #00d4aa (cool complement)
- Background: #0A0A0F (rich black — NOT flat #000)
- Surface: rgba(255,255,255,0.04) (cards)
- Surface hover: rgba(255,255,255,0.07)
- Border: rgba(255,255,255,0.10)
- Text primary: #FFFFFF
- Text secondary: rgba(255,255,255,0.6)
- Text muted: rgba(255,255,255,0.4)

## Typography
- Font: Inter (system fallback: -apple-system)
- Headings: -0.02em letter-spacing, font-weight 700
- Hero: 48–64px, gradient text optional
- Section heading: 32–36px
- Body: 15–16px, line-height 1.6
- Code: Menlo 14px
- Labels/badges: 11–12px uppercase, 0.08em tracking

## Spacing & Layout
- Section gap: 64px (py-16)
- Card padding: 24px
- Inner content gap: 12–16px
- Max content width: 1200px
- Border radius: 16px cards, 12px modals, 8px buttons

## Dark Mode Aesthetic
- NEVER flat black. Use depth through:
  - Subtle gradients (bg-gradient-to-b)
  - Glow effects on hover (box-shadow coral)
  - Border separators (rgba white 0.10)
  - Surface elevation (slightly lighter bg)

## Component Patterns

### Cards
```tsx
<div className="rounded-2xl border border-white/10 bg-white/[0.04] p-6 hover:bg-white/[0.07] transition-colors">
```

### Primary Button
```tsx
<button className="rounded-lg bg-[#FF6B35] px-6 py-3 text-sm font-semibold text-white hover:bg-[#FF8F6B] active:scale-95 transition-all">
```

### Section Header
```tsx
<div className="text-center mb-16">
  <h2 className="text-3xl font-bold tracking-tight text-white mb-4">
    Title
  </h2>
  <p className="text-white/60 text-lg max-w-2xl mx-auto">
    Subtitle
  </p>
</div>
```

### Gradient Text
```tsx
<span className="bg-gradient-to-r from-[#FF6B35] to-[#00d4aa] bg-clip-text text-transparent">
```

### Input Field
```tsx
<input className="w-full rounded-lg border border-white/10 bg-white/[0.04] px-4 py-3 text-white placeholder:text-white/30 focus:border-[#FF6B35]/50 focus:outline-none focus:ring-1 focus:ring-[#FF6B35]/50 transition-colors" />
```

## Animation Standards
- Transition duration: 150ms for micro, 300ms for layout
- Easing: cubic-bezier(0.23, 1, 0.32, 1) for entries
- Scale entries: scale(0.95) + opacity:0 → scale(1) + opacity:1
- Button active: scale(0.97) on :active
- Stagger lists: 50ms delay between items
- Never animate non-transform/opacity properties

## Forbidden
- No flat #000000 backgrounds — always #0A0A0F or gradient
- No pure white text on dark without opacity
- No hardcoded pixel values when Tailwind class exists
- No light mode without dark mode working first
- No animations over 400ms on UI interactions
- No border-radius below 8px on interactive elements
