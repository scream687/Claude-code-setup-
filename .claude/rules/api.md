---
paths:
  - "app/api/**/*"
  - "src/app/api/**/*"
  - "pages/api/**/*"
---

# API Route Rules

## Input Validation
- Validate ALL inputs with Zod schemas — no unvalidated request data ever
- Parse request body: `schema.parse(await req.json())`
- Validate URL params: `z.string().uuid()`
- Return 400 with `{ error: "..." }` on validation failure
- Validate query params before use — never trust raw `searchParams`

## Authentication
- All protected routes: `const user = await requireAuth()`
- `requireAuth()` throws 401 if no session — never return data without confirming auth
- Never trust client-sent user IDs — always use `auth.uid()` from session
- Service role operations in separate server-only modules — never exposed to client

## Error Handling
- Consistent response format: `{ error: string, code?: string }`
- Never expose stack traces or internal errors in responses
- Log errors with context: route, user_id, input (sanitized)
- Return appropriate HTTP status codes:
  - 400 = bad input
  - 401 = no auth
  - 403 = forbidden
  - 404 = not found
  - 429 = rate limited
  - 500 = server error

## Rate Limiting
- All public endpoints: `rateLimit(req, { max: 10 })`
- Auth endpoints (login, register, reset): `rateLimit(req, { max: 3 })`
- Export/heavy operations: `rateLimit(req, { max: 5 })`
- Use Upstash Redis: `@upstash/ratelimit`

## Response
- Always return `NextResponse.json()`
- Set `Cache-Control` headers where appropriate — no accidental caching of user data
- Stripe webhooks: return 200 quickly, process async — never slow down webhook response
- Paginated endpoints: always include `{ data, count, page, limit }` envelope

## Security
- CORS: explicit allowlist — never wildcard in production
- Webhook signatures: always verify before processing — `stripe.webhooks.constructEvent()`
- File uploads: validate type and size before processing — never trust Content-Type header
- Never log full request body — could contain passwords or card numbers

## Performance
- No blocking operations in route handlers — use async/await
- Database calls: use connection pooling, never raw connections
- Heavy operations: offload to background job — route returns 202 Accepted
- No N+1 queries — batch database calls where possible

## Forbidden
- No `console.log` with sensitive data in production routes
- No direct database access from middleware — only in route handlers
- No synchronous file system operations
- No hardcoded secrets or API keys — environment variables only
- No `eval()` or dynamic code execution
