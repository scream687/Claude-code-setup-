---
paths:
  - "app/**/*"
  - "components/**/*"
  - "src/app/**/*"
  - "src/components/**/*"
---

# Frontend Rules

## Component Structure
- Functional components only — no class components
- One component per file — no multi-export component files
- Props interface defined above the component, named `[ComponentName]Props`
- Default export at bottom of file, named export at top

## TypeScript
- TypeScript strict mode — no `any`, no `as` casts without comment
- All props fully typed — no implicit `any` from missing interface
- Return type explicit on all non-trivial functions
- Use `const` assertions for static config objects

## Styling
- Tailwind utility classes only — no inline styles, no CSS modules unless forced
- Dark mode first — light mode via overrides
- Responsive at every breakpoint — mobile first
- No hardcoded colors — use design token classes only

## State Management
- Local state with `useState` for UI-only state
- Zustand store for shared state — `subscribeWithSelector` on all stores
- No prop drilling past 2 levels — use store or context
- No `useEffect` for derived state — use `useMemo`

## Performance
- No unnecessary re-renders — wrap expensive components in `memo`
- `useCallback` on handlers passed as props
- `useMemo` on expensive computations — not as default
- Images: always `next/image` with explicit width/height
- Dynamic imports for components over 50KB

## Error Handling
- Error boundaries around every async data section
- Loading and error states required on every data fetch
- Never let a component crash the full page

## Accessibility
- All interactive elements have `aria-label` if no visible text
- Focus management on modals and drawers
- Keyboard navigable — no mouse-only interactions
- Color contrast ratio minimum 4.5:1

## Icons
- Use `@phosphor-icons/react` for all icons — no other icon libraries
- Size via `size` prop — never via className width/height

## Forbidden
- No `dangerouslySetInnerHTML` without explicit sanitization comment
- No inline event handlers on non-interactive elements
- No direct DOM manipulation — use refs only when necessary
- No console.log in component files
