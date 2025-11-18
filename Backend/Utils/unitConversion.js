// unitConversion.js
// Very simple conversion helpers for demo purposes.

function gramsToUS(grams) {
  // Approximate: 1 oz ~ 28g
  const ounces = grams / 28.0;
  return `${ounces.toFixed(1)} oz`;
}

function mlToUS(ml) {
  // Approximate: 1 cup ~ 240 ml
  const cups = ml / 240.0;
  return `${cups.toFixed(1)} cup${cups >= 1.5 ? 's' : ''}`;
}

function convertToMetricAndUS(ingredient) {
  const { name, amount, unit } = ingredient;

  if (unit === 'g') {
    return {
      name,
      metric: `${amount} g`,
      us: gramsToUS(amount),
    };
  }

  if (unit === 'ml') {
    return {
      name,
      metric: `${amount} ml`,
      us: mlToUS(amount),
    };
  }

  // Fallback: unknown unit
  return {
    name,
    metric: `${amount} ${unit}`,
    us: `${amount} ${unit}`,
  };
}

module.exports = { convertToMetricAndUS };
