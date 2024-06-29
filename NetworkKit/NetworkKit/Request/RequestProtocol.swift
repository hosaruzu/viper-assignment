//
//  RequestProtocol.swift
//  NetworkKit
//
//  Created by Artem Tebenkov on 29.06.2024.
//

protocol RequestProtocol {
    var path: String { get }
}

extension RequestProtocol {
    var host: String {
        APICostants.host
    }

    var requestType: RequestType {
        .GET
    }

    var scheme: HTTPScheme {
        .https
    }

    func createURLReques() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = scheme.rawValue
        components.host = host
        components.path = path

        guard let url = components.url else { throw NetworkError.invalidURL }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        
        return urlRequest
    }
}
