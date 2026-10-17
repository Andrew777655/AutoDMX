-- Custom label for the link button in the final DM (Instagram caps button titles at 20 characters).
-- NULL means the default "Open link".
ALTER TABLE automations ADD COLUMN IF NOT EXISTS button_text TEXT;
