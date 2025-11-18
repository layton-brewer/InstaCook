import Foundation

// Codable models matching the backend JSON payloads.

struct Ingredient: Codable, Identifiable {
    let id = UUID()
    let name: String
    let metric: String
    let us: String
}

struct Recipe: Codable, Identifiable {
    let id = UUID()
    let title: String
    let ingredients: [Ingredient]
    let instructions: [String]
    let prepTime: String
    let servings: Int
}

struct User: Codable {
    let id: String
    let email: String?
}
