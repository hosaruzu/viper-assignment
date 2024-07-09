//
//  RequestManager.swift
//  NetworkKit
//
//  Created by Artem Tebenkov on 29.06.2024.
//

protocol RequestManagerProtocol {
    func perform<T: Decodable>(_ request: some RequestProtocol) async throws -> T
}

public final class RequestManager: RequestManagerProtocol {
    public let apiManager: APIManagerProtocol
    public let parser: DataParserProtocol

    public init(
        apiManager: APIManagerProtocol = APIManager(),
        parser: DataParserProtocol = DataParser()
    ) {
        self.apiManager = apiManager
        self.parser = parser
    }

    public func perform<T: Decodable>(_ request: some RequestProtocol) async throws -> T {
        let data = try await apiManager.perform(request)
        do {
            let decoded: T = try parser.parse(data: data)
            return decoded
        } catch {
            print("Decoder error")
            throw NetworkError.decodingFailure
        }
    }
}
