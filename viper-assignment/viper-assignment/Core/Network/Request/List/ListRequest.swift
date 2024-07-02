//
//  ListRequest.swift
//  NetworkKit
//
//  Created by Artem Tebenkov on 29.06.2024.
//

public enum ListRequest: RequestProtocol {
    case getProductList

    public var path: String {
        "/s/interns-ios/main-page.json"
    }
}
