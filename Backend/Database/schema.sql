-- PostgreSQL schema for InstaCook

CREATE TABLE IF NOT EXISTS users (
  id TEXT PRIMARY KEY,
  email TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS recipes (
  id TEXT PRIMARY KEY,
  user_id TEXT REFERENCES users(id),
  title TEXT NOT NULL,
  instructions TEXT[],
  prep_time TEXT,
  servings INT,
  source TEXT,
  caption TEXT,
  media TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS ingredients (
  id SERIAL PRIMARY KEY,
  recipe_id TEXT REFERENCES recipes(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  metric TEXT NOT NULL,
  us TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS sources (
  id SERIAL PRIMARY KEY,
  recipe_id TEXT REFERENCES recipes(id) ON DELETE CASCADE,
  platform TEXT NOT NULL,
  url TEXT NOT NULL,
  metadata JSONB
);
