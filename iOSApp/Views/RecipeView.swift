import SwiftUI

struct RecipeView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text(recipe.title)
                    .font(.title)
                    .bold()

                Text("Prep time: \(recipe.prepTime) • Servings: \(recipe.servings)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Divider()

                Text("Ingredients")
                    .font(.headline)

                ForEach(recipe.ingredients) { ingredient in
                    HStack {
                        Text(ingredient.name)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(ingredient.metric)
                            Text(ingredient.us)
                                .foregroundColor(.secondary)
                                .font(.caption)
                        }
                    }
                }

                Divider()

                Text("Instructions")
                    .font(.headline)

                ForEach(Array(recipe.instructions.enumerated()), id: \.offset) { index, step in
                    HStack(alignment: .top) {
                        Text("\(index + 1).")
                            .bold()
                        Text(step)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Recipe")
    }
}
