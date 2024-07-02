//
//  RequestManagerTests.swift
//  NetworkKitTests
//
//  Created by Artem Tebenkov on 02.07.2024.
//

import XCTest
@testable import viper_assignment

final class RequestManagerTests: XCTestCase {

    private var requestManager: RequestManagerProtocol?

    override func setUp() {
        super.setUp()

        guard let userDefaults = UserDefaults(suiteName: #file) else { return }

        userDefaults.removePersistentDomain(forName: #file)

        requestManager = RequestManager(apiManager: APIManagerMock())
    }

    func testRequestsProductsList() async throws {
        guard let container: ListProductsContainer = try await requestManager?.perform(
            ProductListRequestMock.getProducts
        ) else {
            XCTFail("Didn't get data from the request manager")
            return
        }

        let products = container.advertisements
        let first = products.first
        let last = products.last
        XCTAssertEqual(first?.id, "1")
        XCTAssertEqual(first?.title, "Смартфон Apple iPhone 12")
        XCTAssertEqual(last?.id, "30")
        XCTAssertEqual(last?.title, "Кресло-качалка")
    }
}
