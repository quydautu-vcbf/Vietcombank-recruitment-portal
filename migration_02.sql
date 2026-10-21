-- Run once in Supabase SQL Editor after 01_schema.sql.
-- Compatibility migration for the new web API.
ALTER TABLE public.attempts ADD COLUMN IF NOT EXISTS data JSONB NOT NULL DEFAULT '{}'::jsonb;
ALTER TABLE public.attempts ALTER COLUMN role_id SET DEFAULT 0;
ALTER TABLE public.attempts ALTER COLUMN exam_json SET DEFAULT '{}'::jsonb;
ALTER TABLE public.attempts ALTER COLUMN candidate_name SET DEFAULT '';
ALTER TABLE public.attempts ALTER COLUMN email SET DEFAULT '';
ALTER TABLE public.attempts ALTER COLUMN phone SET DEFAULT '';
ALTER TABLE public.attempts ALTER COLUMN token_hash SET DEFAULT '';
ALTER TABLE public.attempts ALTER COLUMN duration_minutes SET DEFAULT 40;
ALTER TABLE public.attempts ALTER COLUMN started_at SET DEFAULT (EXTRACT(EPOCH FROM now())::bigint);
ALTER TABLE public.attempts ALTER COLUMN expires_at SET DEFAULT (EXTRACT(EPOCH FROM now())::bigint + 2400);
