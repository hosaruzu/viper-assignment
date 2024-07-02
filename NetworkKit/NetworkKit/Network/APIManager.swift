//
//  APIManager.swift
//  NetworkKit
//
//  Created by Artem Tebenkov on 29.06.2024.
//

public protocol APIManagerProtocol {
    func perform(_ request: RequestProtocol) async throws -> Data
}

public class APIManager: APIManagerProtocol {

    private let urlSession: URLSession

   public init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    public func perform(_ request: RequestProtocol) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLReques())
        guard let httpResonse = response as? HTTPURLResponse,
              httpResonse.statusCode == 200
        else {
            throw NetworkError.invalidServerResponse
        }
        return data
    }
}
