//
//  DataParser.swift
//  NetworkKit
//
//  Created by Artem Tebenkov on 29.06.2024.
//

protocol DataParserProtocol {
    func parse<T: Decodable>(data: Data) throws -> T
}

final class DataParser: DataParserProtocol {

    private var jsonDecoder: JSONDecoder

    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    func parse<T: Decodable>(data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
}
