// Auth routes: Clerk-backed authentication (placeholder until real keys are provided).

const express = require('express');
const router = express.Router();

// POST /auth/login - placeholder; real implementation will validate Clerk session tokens.
router.post('/login', (req, res) => {
  return res.status(200).json({ message: 'Auth placeholder - integrate Clerk JWT/session validation here.' });
});

module.exports = router;
