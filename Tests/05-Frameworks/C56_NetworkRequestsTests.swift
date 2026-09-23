import Foundation
import Synchronization
import Testing
@testable import Challenges

@Suite("C56 · Making a Network Request")
struct C56_NetworkRequestsTests {
    final class MockLoader: HTTPLoading {
        let result: Result<(Data, URLResponse), any Error>
        let lastRequest = Mutex<URLRequest?>(nil)

        init(result: Result<(Data, URLResponse), any Error>) {
            self.result = result
        }

        func data(for request: URLRequest) async throws -> (Data, URLResponse) {
            lastRequest.withLock { $0 = request }
            return try result.get()
        }
    }

    let baseURL = URL(string: "https://api.test.dev")!

    func response(status: Int) -> HTTPURLResponse {
        HTTPURLResponse(url: baseURL, statusCode: status, httpVersion: nil, headerFields: nil)!
    }

    @Test func buildsCorrectRequest() async throws {
        let loader = MockLoader(result: .success((Data("[]".utf8), response(status: 200))))
        _ = try await RepoClient(loader: loader, baseURL: baseURL).repositories(for: "twostraws")

        let request = try #require(loader.lastRequest.withLock { $0 })
        #expect(request.url?.absoluteString == "https://api.test.dev/users/twostraws/repos")
        #expect(request.httpMethod == "GET")
        #expect(request.value(forHTTPHeaderField: "Accept") == "application/json")
    }

    @Test func decodesRepos() async throws {
        let json = #"[{"name":"Unwrap","stargazers_count":2100},{"name":"Inferno","stargazers_count":1200}]"#
        let loader = MockLoader(result: .success((Data(json.utf8), response(status: 200))))
        let repos = try await RepoClient(loader: loader, baseURL: baseURL).repositories(for: "x")
        #expect(repos == [Repo(name: "Unwrap", stargazersCount: 2100), Repo(name: "Inferno", stargazersCount: 1200)])
    }

    @Test func badStatus() async {
        let loader = MockLoader(result: .success((Data(), response(status: 404))))
        await #expect(throws: APIError.badStatus(404)) {
            try await RepoClient(loader: loader, baseURL: baseURL).repositories(for: "x")
        }
    }

    @Test func nonHTTPResponse() async {
        let plain = URLResponse(url: baseURL, mimeType: nil, expectedContentLength: 0, textEncodingName: nil)
        let loader = MockLoader(result: .success((Data(), plain)))
        await #expect(throws: APIError.badStatus(-1)) {
            try await RepoClient(loader: loader, baseURL: baseURL).repositories(for: "x")
        }
    }

    @Test func decodingFailure() async {
        let loader = MockLoader(result: .success((Data("{oops".utf8), response(status: 200))))
        await #expect(throws: APIError.decodingFailed) {
            try await RepoClient(loader: loader, baseURL: baseURL).repositories(for: "x")
        }
    }

    @Test func transportErrorsPassThrough() async {
        let loader = MockLoader(result: .failure(URLError(.notConnectedToInternet)))
        await #expect(throws: URLError.self) {
            try await RepoClient(loader: loader, baseURL: baseURL).repositories(for: "x")
        }
    }
}
