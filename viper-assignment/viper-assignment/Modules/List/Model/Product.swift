//
//  Product.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 04.07.2024.
//

import Foundation

struct Product: Hashable {
    public let id: String
    public let title: String
    public let price: String
    public let location: String
    public let imageUrl: URL?
    public let createdDate: String
}

extension Product {
    init(_ model: ListProduct) {
        self.id = model.id
        self.title = model.title
        self.price = model.price
        self.location = model.location
        self.imageUrl = URL(string: model.imageUrl)
        self.createdDate = model.createdDate
    }
}

extension String {
    var convertedDateFormat: String {
        self
    }
}
