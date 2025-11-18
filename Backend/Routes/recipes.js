// /recipes routes: store and retrieve recipes for an authenticated user.

const express = require('express');
const router = express.Router();
const { requireAuth } = require('../Middleware/authCheck');
const recipeController = require('../Controllers/recipeController');

// All recipe routes require auth (Clerk-backed; currently a stub).
router.use(requireAuth);

// POST /recipes
router.post('/', recipeController.createRecipe);

// GET /recipes
router.get('/', recipeController.listRecipes);

// DELETE /recipes
router.delete('/', recipeController.deleteRecipe);

module.exports = router;
