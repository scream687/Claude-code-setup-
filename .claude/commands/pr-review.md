---
name: pr-review
description: Review a pull request end to end — diff, security, performance, quality, and final verdict
disable-model-invocation: true
---

Review this pull request completely before it merges. Be thorough. Be specific. Be honest.

## Step 1: Understand the PR

1. Read the PR title and description completely
2. Understand the intent — what problem is this solving?
3. Run `git diff main...HEAD` to see all changes
4. Read every modified file top to bottom
5. Map which components, APIs, and data flows were touched

## Step 2: Security Scan

6. Grep for hardcoded secrets, API keys, tokens — `grep -rn "password\|secret\|api_key\|token" --include="*.ts"`
7. Confirm `.env` files are in `.gitignore` and not committed
8. Check all API inputs are validated before use
9. Check for SQL injection in any raw queries
10. Check for XSS — no `dangerouslySetInnerHTML` without sanitization
11. Verify auth middleware present on all new protected routes
12. Check for missing ownership checks on resource endpoints (IDOR risk)

## Step 3: Performance Check

13. No unnecessary re-renders — check `memo`, `useCallback` usage
14. No N+1 database query patterns
15. No blocking synchronous operations in async contexts
16. No heavy computation inside render or loop
17. Check bundle size impact of any new dependencies — `npm run build -- --analyze`
18. Confirm no memory leaks — event listeners and subscriptions cleaned up

## Step 4: Code Quality

19. TypeScript strict — no `any`, no untyped `as` casts
20. Functions under 50 lines — flag anything longer
21. No duplicated logic — DRY violations noted
22. Descriptive names — no single letters, no unclear abbreviations
23. Error handling on all async operations
24. No commented-out dead code
25. No console.log or debug prints in production paths

## Step 5: Test Coverage

26. Does this PR include tests for the new behavior?
27. Do existing tests still pass — `npm test`
28. Are edge cases covered — null, empty, invalid input?
29. If no tests added — flag this explicitly in the review

## Step 6: Final Build Check

30. `npm run build` — confirm production build is clean with these changes
31. `npm run lint` — zero warnings

## Step 7: Write the Review

Use this format:

```
## PR Review

### Summary
[2 sentences: what this PR does and overall quality assessment]

### Verdict: APPROVE / REQUEST CHANGES / BLOCK

---

### 🔴 BLOCKING — [Issue]
Location: [file:line]
Problem: [what and why]
Fix: [exact fix]

### 🟠 MUST FIX — [Issue]
[same structure]

### 🟡 SHOULD FIX — [Issue]
[same structure]

### 🟢 SUGGESTION — [Issue]
[same structure]

---

### What's Done Well
[specific, not generic]

### Before Merge
[numbered list of required actions]
```

## Verdicts

**APPROVE** — no blocking issues, production ready as-is
**REQUEST CHANGES** — issues found, must be addressed before merge
**BLOCK** — critical security or data integrity issue, do not merge under any circumstances

Never approve your own PR. Never approve without running the build.
