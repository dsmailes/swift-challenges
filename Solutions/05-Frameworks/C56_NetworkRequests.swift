// Solution · Challenge 56 · Making a Network Request

import Foundation

protocol HTTPLoading: Sendable {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: HTTPLoading {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await data(for: request, delegate: nil)
    }
}

struct Repo: Decodable, Equatable {
    let name: String
    let stargazersCount: Int
}

enum APIError: Error, Equatable {
    case badStatus(Int)
    case decodingFailed
}

struct RepoClient {
    let loader: any HTTPLoading
    let baseURL: URL

    init(loader: any HTTPLoading = URLSession.shared, baseURL: URL = URL(string: "https://api.example.com")!) {
        self.loader = loader
        self.baseURL = baseURL
    }

    func repositories(for username: String) async throws -> [Repo] {
        let url = baseURL.appending(path: "users/\(username)/repos")

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, response) = try await loader.data(for: request)

        guard let http = response as? HTTPURLResponse else {
            throw APIError.badStatus(-1)
        }
        guard (200..<300).contains(http.statusCode) else {
            throw APIError.badStatus(http.statusCode)
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            return try decoder.decode([Repo].self, from: data)
        } catch {
            throw APIError.decodingFailed
        }
    }
}
