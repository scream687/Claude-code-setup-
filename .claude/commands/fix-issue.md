---
name: fix-issue
description: Fix a GitHub issue end to end — reproduce, diagnose, patch, test, and open PR
disable-model-invocation: true
---

Fix the specified issue end to end.

## Step 1: Understand the Issue
1. Read the issue title and description completely
2. Identify: what is broken, what is expected, what is actually happening
3. Note any reproduction steps provided

## Step 2: Reproduce Locally
4. Pull latest from main — `git pull origin main`
5. Create a branch — `git checkout -b fix/issue-[number]`
6. Run the app and reproduce the bug exactly as described
7. Confirm you see the same broken behavior before touching code

## Step 3: Diagnose Root Cause
8. Read all files related to the broken behavior
9. Trace the execution path from input to broken output
10. State the root cause in one sentence before writing any fix
11. If root cause is unclear — add logs, re-run, find it first

## Step 4: Write the Fix
12. Fix the root cause — not the symptom
13. Keep the fix minimal — only change what is necessary
14. Do not refactor unrelated code in the same commit
15. Add a comment if the fix is non-obvious

## Step 5: Write or Update Tests
16. Write a test that fails before the fix and passes after
17. Run the full test suite — `npm test` or equivalent
18. Confirm zero test failures

## Step 6: Verify End to End
19. Run the app locally
20. Reproduce the original issue steps — confirm it is fixed
21. Test adjacent functionality — confirm nothing else broke

## Step 7: Commit and PR
22. `git add .`
23. `git commit -m "fix: [description of what was fixed] — closes #[issue number]"`
24. `git push origin fix/issue-[number]`
25. Open PR with: what the bug was, what caused it, how it was fixed, how to verify

## If Anything Blocks You
- Do NOT guess at the fix without understanding root cause
- Do NOT skip the reproduction step
- Do NOT open a PR with failing tests
- If the issue is unclear — comment on it asking for clarification before coding
