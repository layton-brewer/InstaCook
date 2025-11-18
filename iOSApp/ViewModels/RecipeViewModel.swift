import Foundation

@MainActor
final class RecipeViewModel: ObservableObject {
    @Published var inputURL: String = ""
    @Published var isLoading: Bool = false
    @Published var currentRecipe: Recipe?
    @Published var errorMessage: String?

    private let network = NetworkService.shared

    func generateRecipe() async {
        guard !inputURL.isEmpty else {
            errorMessage = "Please paste a URL."
            return
        }

        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            let processed = try await network.process(url: inputURL)
            let recipe = try await network.generate(from: processed)
            currentRecipe = recipe
        } catch {
            errorMessage = "Failed to generate recipe. Please try again."
        }
    }
}
