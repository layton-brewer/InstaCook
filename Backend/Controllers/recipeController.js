// Controllers for recipe CRUD operations.
// Currently uses in-memory storage; will be replaced with PostgreSQL via Neon.

let recipes = [];
let idCounter = 1;

exports.createRecipe = (req, res) => {
  const { recipe } = req.body;
  if (!recipe || !recipe.title) {
    return res.status(400).json({ error: 'Missing recipe payload or title' });
  }
  const userId = req.user?.id || 'anonymous';
  const record = {
    id: `r${idCounter++}`,
    userId,
    createdAt: new Date().toISOString(),
    ...recipe,
  };
  recipes.push(record);
  return res.status(201).json({ status: 'success', recipeId: record.id });
};

exports.listRecipes = (req, res) => {
  const userId = req.user?.id || 'anonymous';
  const userRecipes = recipes.filter(r => r.userId === userId);
  return res.json(userRecipes);
};

exports.deleteRecipe = (req, res) => {
  const { recipeId } = req.body;
  if (!recipeId) {
    return res.status(400).json({ error: 'Missing recipeId' });
  }
  const userId = req.user?.id || 'anonymous';
  const before = recipes.length;
  recipes = recipes.filter(r => !(r.id === recipeId && r.userId === userId));
  const deleted = before !== recipes.length;
  return res.json({ status: deleted ? 'deleted' : 'not_found' });
};
