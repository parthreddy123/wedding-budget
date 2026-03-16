-- Run this in Supabase SQL Editor (https://supabase.com/dashboard/project/ddlfzwvnbawsnbeaultu/sql)
-- Only run the parts you haven't already run

-- Wedding Vendors table (NEW)
CREATE TABLE IF NOT EXISTS wedding_vendors (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    category TEXT NOT NULL,
    name TEXT DEFAULT '',
    price NUMERIC,
    contact TEXT DEFAULT '',
    notes TEXT DEFAULT '',
    chosen BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE wedding_vendors ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow all for wedding_vendors" ON wedding_vendors
    FOR ALL USING (true) WITH CHECK (true);

ALTER PUBLICATION supabase_realtime ADD TABLE wedding_vendors;
