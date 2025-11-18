// /generate route: turns parsed social content into a structured recipe via aiProcessor.

const express = require('express');
const router = express.Router();
const { generateRecipeFromContent } = require('../Utils/aiProcessor');

// POST /generate
router.post('/', async (req, res, next) => {
  try {
    const { source, caption, media } = req.body;
    if (!source || !caption) {
      return res.status(400).json({ error: 'Missing source or caption in request body' });
    }

    const recipe = await generateRecipeFromContent({ source, caption, media });
    return res.status(200).json({ recipe });
  } catch (err) {
    next(err);
  }
});

module.exports = router;
