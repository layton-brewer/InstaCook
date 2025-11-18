// aiProcessor.js
// Converts social content into a structured recipe.
// In production this would call an AI model; here we simulate deterministic output.

const { convertToMetricAndUS } = require('./unitConversion');

async function generateRecipeFromContent({ source, caption, media }) {
  // Simple demo logic: create a pasta recipe regardless of input, but with proper shape.
  const ingredientsRaw = [
    { name: 'Pasta', amount: 250, unit: 'g' },
    { name: 'Mushrooms', amount: 150, unit: 'g' },
    { name: 'Cream', amount: 120, unit: 'ml' },
  ];

  const ingredients = ingredientsRaw.map(convertToMetricAndUS);

  return {
    title: 'Creamy Mushroom Pasta',
    source,
    caption,
    media,
    ingredients,
    instructions: [
      'Boil pasta in salted water until tender.',
      'Sauté mushrooms in butter until golden.',
      'Add cream, simmer briefly, then combine with pasta.',
    ],
    prepTime: '20 minutes',
    servings: 2,
  };
}

module.exports = { generateRecipeFromContent };
