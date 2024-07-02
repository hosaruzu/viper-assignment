//
//  ProductListRequestMock.swift
//  NetworkKitTests
//
//  Created by Artem Tebenkov on 02.07.2024.
//

import Foundation
@testable import viper_assignment

enum ProductListRequestMock: RequestProtocol {
    case getProducts

    var requestType: RequestType {
        .GET
    }

    var path: String {
        guard let path = Bundle.main.path(forResource: "ListProductsMock", ofType: "json") else {
            return "Can't find mock json object" }
        return path
    }
}
