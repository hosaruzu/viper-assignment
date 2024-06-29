//
//  ListProduct.swift
//  NetworkKit
//
//  Created by Artem Tebenkov on 29.06.2024.
//

struct ListProduct: Decodable {
    let id: Int
    let title: String
    let price: String
    let location: String
    let imageURL: String
    let createdDate: String
}

//"id": "1",
//"title": "Смартфон Apple iPhone 12",
//"price": "55000 ₽",
//"location": "Москва",
//"image_url": "https://www.avito.st/s/interns-ios/images/1.png",
//"created_date": "2023-08-16"
