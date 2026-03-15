-- Run this in Supabase SQL Editor (https://supabase.com/dashboard/project/ddlfzwvnbawsnbeaultu/sql)

-- Wedding Budget table
CREATE TABLE IF NOT EXISTS wedding_budget (
    id BIGSERIAL PRIMARY KEY,
    venue TEXT NOT NULL CHECK (venue IN ('estate', 'majestic', 'glasshouse')),
    category TEXT NOT NULL,
    parth_amount NUMERIC DEFAULT 0,
    emily_amount NUMERIC DEFAULT 0,
    other_amount NUMERIC DEFAULT 0,
    notes TEXT DEFAULT '',
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Wedding Decisions table
CREATE TABLE IF NOT EXISTS wedding_decisions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    text TEXT NOT NULL,
    resolved BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE wedding_budget ENABLE ROW LEVEL SECURITY;
ALTER TABLE wedding_decisions ENABLE ROW LEVEL SECURITY;

-- Allow all operations with anon key (simple auth — page is password-protected)
CREATE POLICY "Allow all for wedding_budget" ON wedding_budget
    FOR ALL USING (true) WITH CHECK (true);

CREATE POLICY "Allow all for wedding_decisions" ON wedding_decisions
    FOR ALL USING (true) WITH CHECK (true);

-- Enable realtime
ALTER PUBLICATION supabase_realtime ADD TABLE wedding_budget;
ALTER PUBLICATION supabase_realtime ADD TABLE wedding_decisions;
