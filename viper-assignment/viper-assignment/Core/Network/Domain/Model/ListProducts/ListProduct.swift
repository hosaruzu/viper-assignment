//
//  ListProduct.swift
//  NetworkKit
//
//  Created by Artem Tebenkov on 29.06.2024.
//

import Foundation

public struct ListProduct: Decodable {
    public let id: String
    public let title: String
    public let price: String
    public let location: String
    public let imageUrl: String
    public let createdDate: String
}

extension ListProduct {
    static let mock = loadProductsList()
}

private struct ListProductMock: Decodable {
    let products: [ListProduct]
}
private func loadProductsList() -> [ListProduct] {
    guard let url = Bundle.main.url(forResource: "ListProductsMock", withExtension: "json"),
          let data = try? Data(contentsOf: url) else { return [] }
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let jsonMock = try? decoder.decode(ListProductMock.self, from: data)
    return jsonMock?.products ?? []
}
