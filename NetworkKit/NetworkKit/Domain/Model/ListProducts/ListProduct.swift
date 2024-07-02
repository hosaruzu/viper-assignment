//
//  ListProduct.swift
//  NetworkKit
//
//  Created by Artem Tebenkov on 29.06.2024.
//

public struct ListProduct: Decodable {
    public let id: String
    public let title: String
    public let price: String
    public let location: String
    public let imageUrl: String
    public let createdDate: String
}
