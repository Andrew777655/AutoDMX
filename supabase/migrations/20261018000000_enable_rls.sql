-- Re-enable Row Level Security on all tables.
-- The app only talks to Supabase from the server with the service role key,
-- which bypasses RLS, so this blocks direct access with the public anon key
-- without affecting the app.
ALTER TABLE accounts ENABLE ROW LEVEL SECURITY;
ALTER TABLE automations ENABLE ROW LEVEL SECURITY;
ALTER TABLE contacts ENABLE ROW LEVEL SECURITY;
ALTER TABLE conversation_state ENABLE ROW LEVEL SECURITY;
ALTER TABLE message_log ENABLE ROW LEVEL SECURITY;
ALTER TABLE send_queue ENABLE ROW LEVEL SECURITY;
ALTER TABLE tracked_links ENABLE ROW LEVEL SECURITY;
ALTER TABLE link_clicks ENABLE ROW LEVEL SECURITY;
ALTER TABLE processed_comments ENABLE ROW LEVEL SECURITY;

-- Remove policies that let anyone holding the anon key read or write these tables.
-- Link redirects and click logging run on the server with the service role key.
DROP POLICY IF EXISTS "Allow public select for redirect" ON tracked_links;
DROP POLICY IF EXISTS "Allow service role insert" ON tracked_links;
DROP POLICY IF EXISTS "Allow public insert for clicks" ON link_clicks;
