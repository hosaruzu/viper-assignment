//
//  DetailProduct.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 06.07.2024.
//

import Foundation

struct DetailProduct: Decodable {
    let id: String
    let title: String
    let price: String
    let location: String
    let imageUrl: String
    let createdDate: String
    let description: String
    let email: String
    let phoneNumber: String
    let address: String
}
