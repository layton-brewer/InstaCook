import Foundation

/// Simple networking layer for communicating with the InstaCook backend.
final class NetworkService {
    static let shared = NetworkService()

    // Adjust this base URL when deploying to Render.
    private let baseURL = URL(string: "http://localhost:4000")!

    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    struct ProcessResponse: Codable {
        let postId: String
        let source: String
        let caption: String
        let media: String
    }

    struct GenerateResponse: Codable {
        let recipe: Recipe
    }

    func process(url: String) async throws -> ProcessResponse {
        let endpoint = baseURL.appendingPathComponent("process")
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["url": url]
        request.httpBody = try JSONEncoder().encode(body)

        let (data, response) = try await session.data(for: request)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(ProcessResponse.self, from: data)
    }

    func generate(from processed: ProcessResponse) async throws -> Recipe {
        let endpoint = baseURL.appendingPathComponent("generate")
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: String] = [
            "source": processed.source,
            "caption": processed.caption,
            "media": processed.media
        ]
        request.httpBody = try JSONEncoder().encode(body)

        let (data, response) = try await session.data(for: request)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        let wrapper = try JSONDecoder().decode(GenerateResponse.self, from: data)
        return wrapper.recipe
    }

    func save(recipe: Recipe, userId: String) async throws {
        let endpoint = baseURL.appendingPathComponent("recipes")
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(userId, forHTTPHeaderField: "x-demo-user-id")

        struct Payload: Codable { let recipe: Recipe }
        request.httpBody = try JSONEncoder().encode(Payload(recipe: recipe))

        let (_, response) = try await session.data(for: request)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
    }

    func listRecipes(userId: String) async throws -> [Recipe] {
        let endpoint = baseURL.appendingPathComponent("recipes")
        var request = URLRequest(url: endpoint)
        request.httpMethod = "GET"
        request.addValue(userId, forHTTPHeaderField: "x-demo-user-id")

        let (data, response) = try await session.data(for: request)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([Recipe].self, from: data)
    }
}
