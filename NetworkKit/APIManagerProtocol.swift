//
//  APIManagerProtocol.swift
//  NetworkKit
//
//  Created by Artem Tebenkov on 29.06.2024.
//

protocol APIManagerProtocol {
    func perform(_ request: RequestProtocol) async throws -> Data
}

class APIManager: APIManagerProtocol {

    private let urlSession: URLSession

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    func perform(_ request: RequestProtocol) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLReques())
        guard let httpResonse = response as? HTTPURLResponse,
              httpResonse.statusCode == 200
        else {
            throw NetworkError.invalidServerResponse
        }
        return data
    }
}
