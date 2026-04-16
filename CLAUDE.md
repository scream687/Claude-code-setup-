# CLAUDE.md — Project Brain

The root context file Claude reads at the start of every conversation.
Everything here applies to every interaction in this project.

## Tech Stack
- Next.js 14 (App Router, TypeScript)
- Tailwind CSS + shadcn/ui
- Supabase (Auth + Database)
- Stripe (Payments)
- Vercel (Hosting)
- Zustand (state management)
- Upstash Redis (rate limiting)
- Vitest (unit tests)
- Playwright (e2e tests)

## Folder Structure
- `app/` — pages and API routes (Next.js App Router)
- `components/` — React components
- `lib/` — utilities, helpers, shared logic
- `stores/` — Zustand state stores
- `types/` — shared TypeScript types
- `supabase/` — migrations and SQL
- `public/` — static assets

## Commands
- `npm run dev` — start dev server (port 3000)
- `npm run build` — production build
- `npm test` — run Vitest suite
- `npm run lint` — ESLint check
- `npx playwright test` — e2e tests

## Coding Conventions
- TypeScript strict mode — no `any` types, ever
- Functional components and hooks only — no class components
- Zustand + `subscribeWithSelector` for all global state
- No prop drilling past 2 levels — use store
- Dark mode first, light mode via class overrides
- Error boundaries around all async data sections
- Loading and error states required on every data fetch

## Git Rules
- Commit format: `type: description` (feat, fix, chore, docs, refactor)
- Never push to main without passing tests
- Feature branches for changes touching 5+ files
- Only main branch triggers Vercel production builds
- PR required for anything that touches auth, payments, or database schema

## Security Non-Negotiables
- No secrets in code — environment variables only
- All API routes validate input with Zod before processing
- All protected routes use `requireAuth()` — no exceptions
- RLS enabled on every Supabase table
- Stripe webhook signatures always verified
- Never log sensitive data (passwords, card numbers, tokens)

## What Claude Should Always Do
- Read relevant rule files before editing files in those paths
- Run lint and type check after making changes
- Write or update tests when adding new functionality
- Flag any security concern immediately — do not silently continue
- Ask before making changes that touch more than 5 files at once
- Prefer small, focused changes over large refactors

## What Claude Should Never Do
- Commit directly to main without being asked
- Force push under any circumstances
- Read or output the contents of .env files
- Remove existing error handling to make code shorter
- Introduce new dependencies without flagging it first
- Guess at business logic — ask if intent is unclear
