import SwiftUI

@main
struct InstaCookApp: App {
    @StateObject private var authVM = AuthViewModel()
    @StateObject private var recipeVM = RecipeViewModel()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(authVM)
                .environmentObject(recipeVM)
        }
    }
}
