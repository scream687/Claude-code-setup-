---
name: deploy
description: Deploy to production with all pre-flight checks, verification, and rollback protection
disable-model-invocation: true
---

Deploy to production. Every step must pass. No skipping.

## Pre-flight Checks

1. `git status` — no uncommitted changes. If any exist, stop and resolve first.
2. `git pull origin main` — confirm you are on latest
3. `npm run lint` — zero warnings, zero errors
4. `npm run build` — clean production build, no errors
5. `npm test` — all tests green
6. `npx playwright test` — all e2e tests passing
7. Check no `.env` secrets are committed — `git diff HEAD~1 -- '*.env'`

## Deploy

8. `git push origin main`
9. Wait for CI pipeline to complete — do not proceed until green
10. Wait for build to finish on hosting platform (Vercel / Railway / etc.)
11. Confirm deployment URL is live and responding

## Post-Deploy Verification

12. Open production URL — confirm homepage loads without errors
13. Open browser console — confirm zero JavaScript errors
14. Test core user flow end to end in production
15. Check `/api/health` or equivalent returns 200
16. Verify any webhooks or integrations are receiving events
17. Check error monitoring (Sentry / equivalent) — no spike in errors
18. Check logs — no unexpected warnings or errors in first 5 minutes

## Confirm Deployment

19. Note the deployment timestamp
20. Note the git commit SHA that was deployed — `git rev-parse HEAD`
21. Confirm with team that deployment is complete

## If Anything Fails

- Do NOT force push or skip checks under any circumstances
- Fix the issue first — re-run all checks from Step 1
- If post-deploy error is found — assess severity immediately
- If critical error — rollback immediately, do not wait
- Only the repository owner can approve emergency rollbacks
- Document what went wrong and what was done to fix it
