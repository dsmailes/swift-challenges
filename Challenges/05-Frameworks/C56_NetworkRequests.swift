// ════════════════════════════════════════════════════════════════════════
//  Challenge 56 · Making a Network Request                     Difficulty ★★★
//  Interview question: "What steps would you follow to make a network
//  request?"
// ════════════════════════════════════════════════════════════════════════
//
//  BACKGROUND
//  A robust request usually goes: build a URL safely → create a URLRequest
//  (method, headers) → perform it with URLSession (async/await) → check the
//  HTTP status code → decode the body → map failures to meaningful errors.
//  Hiding URLSession behind a small protocol (`HTTPLoading`) lets tests supply
//  canned responses without touching the network.
//
//  YOUR TASK
//  Implement `RepoClient.repositories(for:)`:
//  1. Build the URL `<baseURL>/users/<username>/repos` (use
//     `appending(path:)`).
//  2. Create a GET request with the header "Accept: application/json".
//  3. Call `loader.data(for:)`.
//  4. If the response isn't an HTTPURLResponse with a 2xx status, throw
//     `APIError.badStatus(code)` (use -1 if it's not HTTP at all).
//  5. Decode `[Repo]` using `.convertFromSnakeCase` (the JSON has
//     `stargazers_count`). Throw `APIError.decodingFailed` if it fails.
//  Transport errors thrown by the loader should pass straight through.
// ════════════════════════════════════════════════════════════════════════

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
        // TODO
        []
    }
}
