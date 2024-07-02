//
//  ListInteractor.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import NetworkKit

final class ListInteractor {

    // MARK: - Dependencies

    private let requestManager: RequestManager

    // MARK: - Interactor output

    weak var output: ListInteractorOutput?

    // MARK: - Init

    init(requestManger: RequestManager) {
        self.requestManager = requestManger
    }
}

// MARK: - ListInteractorInput

extension ListInteractor: ListInteractorInput {
    func obtainProductsList() async throws {
        let data: ListProductsContainer = try await requestManager.perform(ListRequest.getProductList)
        output?.setSuccessObtainData(data)
    }
}
