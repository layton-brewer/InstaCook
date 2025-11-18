// Database connection helper for Neon PostgreSQL.
// Reads connection details from environment variables (as configured in environment.json).

const { Pool } = require('pg');

const pool = new Pool({
  connectionString: process.env.DATABASE_URL || '',
});

module.exports = {
  query: (text, params) => pool.query(text, params),
  pool,
};
