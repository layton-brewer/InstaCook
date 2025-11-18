import SwiftUI

struct MainView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var recipeVM: RecipeViewModel

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("InstaCook")
                    .font(.largeTitle)
                    .bold()

                TextField("Paste Instagram, TikTok, or YouTube URL", text: $recipeVM.inputURL)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .keyboardType(.URL)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)

                if recipeVM.isLoading {
                    LoadingView()
                } else {
                    Button(action: {
                        Task { await recipeVM.generateRecipe() }
                    }) {
                        Text("Generate Recipe")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal)
                }

                if let error = recipeVM.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }

                if let recipe = recipeVM.currentRecipe {
                    NavigationLink(destination: RecipeView(recipe: recipe)) {
                        Text("View Generated Recipe")
                    }
                    .padding(.top)
                }

                Spacer()
            }
            .padding()
            .toolbar {
                NavigationLink(destination: AuthView()) {
                    Image(systemName: "person.circle")
                }
            }
        }
    }
}
