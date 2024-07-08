//
//  DetailRequest.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 06.07.2024.
//

public enum DetailRequest: RequestProtocol {
    case getDetail(_ id: String)

    public var path: String {
        switch self {
        case .getDetail(let id):
            "/s/interns-ios/details/\(id).json"
        }
    }
}
