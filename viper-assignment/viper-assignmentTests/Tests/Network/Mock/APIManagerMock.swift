//
//  APIManagerMock.swift
//  NetworkKitTests
//
//  Created by Artem Tebenkov on 02.07.2024.
//

import Foundation
@testable import viper_assignment

struct APIManagerMock: APIManagerProtocol {
    func perform(_ request: RequestProtocol) async throws -> Data {
        print(request.path)
        return try Data(contentsOf: URL(fileURLWithPath: request.path), options: .mappedIfSafe)
    }
}
