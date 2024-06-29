//
//  RequestProtocol.swift
//  NetworkKit
//
//  Created by Artem Tebenkov on 29.06.2024.
//

protocol RequestProtocol {
    var scheme: HTTPScheme { get set }
    var path: String { get set }
    var urlParams: [String: String?] { get }
    var requestType: RequestType { get }
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

    var params: [String: String?] {
        [:]
    }

    func createURLReques() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = scheme.rawValue
        components.host = host
        components.path = path

        if !urlParams.isEmpty {
            components.queryItems = urlParams.map {
                URLQueryItem(name: $0, value: $1)
            }
        }

        guard let url = components.url else { throw NetworkError.invalidURL }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        
        return urlRequest
    }
}
