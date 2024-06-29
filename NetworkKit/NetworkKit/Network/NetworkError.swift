//
//  NetworkError.swift
//  NetworkKit
//
//  Created by Artem Tebenkov on 29.06.2024.
//

enum NetworkError: Error, CustomStringConvertible {
    case invalidURL
    case invalidServerResponse

    var description: String {
        switch self {
        case .invalidURL:
            "URL string in malformed."
        case .invalidServerResponse:
            "The server returned an invalid response."
        }
    }
}
