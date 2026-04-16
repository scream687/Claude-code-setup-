---
paths:
  - "supabase/**/*"
  - "lib/db/**/*"
  - "src/lib/db/**/*"
  - "prisma/**/*"
---

# Database Rules

## Queries
- Never use `SELECT *` in production queries — always name columns explicitly
- Always use parameterized queries — no string concatenation to build SQL
- All queries touching more than 1000 rows must have a LIMIT clause
- Explain slow queries before optimizing — no premature optimization

## Supabase
- Always use Row Level Security (RLS) — no table without RLS policies
- Never bypass RLS with service role key in client-side code
- Use `supabaseAdmin` only in server-side API routes — never in components
- Auth: always `const { data: { user } } = await supabase.auth.getUser()` — never trust client-sent user IDs

## Migrations
- Every schema change goes through a migration file — no direct schema edits in dashboard
- Migration files are named: `[timestamp]_[description].sql`
- All migrations must be reversible — include rollback SQL in comments
- Test migrations on staging before production

## Performance
- Index all foreign key columns
- Index all columns used in WHERE clauses on large tables
- Use connection pooling — never open raw connections in serverless functions
- Batch inserts over 100 rows — never insert in a loop

## Data Integrity
- All foreign keys have explicit `ON DELETE` behavior defined
- Soft delete preferred over hard delete for user-facing data — add `deleted_at` column
- All monetary values stored as integers (cents/paise) — never floats
- Timestamps always in UTC — no local timezone storage

## Security
- No credentials, connection strings, or service keys in code — environment variables only
- Sanitize all user input before database operations
- Log database errors with context but never expose raw errors to client
- Regular backups verified — not just enabled

## Forbidden
- No raw SQL in React components or pages — always in server actions or API routes
- No synchronous database calls in middleware
- No transactions spanning multiple API requests
- No dropping tables or columns without a migration plan and backup
