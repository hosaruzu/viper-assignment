//
//  ListRequest.swift
//  NetworkKit
//
//  Created by Artem Tebenkov on 29.06.2024.
//

enum ListRequest: RequestProtocol {
    case getProductList

    var path: String {
        "/s/interns-ios/main-page.json"
    }
}
