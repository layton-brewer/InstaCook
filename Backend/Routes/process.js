// /process route: accepts a social media URL and extracts basic metadata via socialParser.

const express = require('express');
const router = express.Router();
const { parseSocialUrl } = require('../Utils/socialParser');

// POST /process
router.post('/', async (req, res, next) => {
  try {
    const { url } = req.body;
    if (!url) {
      return res.status(400).json({ error: 'Missing url in request body' });
    }

    const parsed = await parseSocialUrl(url);
    return res.status(200).json(parsed);
  } catch (err) {
    next(err);
  }
});

module.exports = router;
