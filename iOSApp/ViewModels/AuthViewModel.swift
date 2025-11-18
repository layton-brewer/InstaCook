import Foundation

/// Placeholder for Clerk-powered auth.
/// For now we simulate a signed-in user with a static id.
@MainActor
final class AuthViewModel: ObservableObject {
    @Published var currentUser: User? = User(id: "usr-demo", email: "demo@example.com")
}
