//
//  ListInteractor.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//
import Foundation

final class ListInteractor {

    // MARK: - Dependencies

    private let repository: ListProductRepositoryProtocol

    // MARK: - Interactor output

    weak var output: ListInteractorOutput?

    // MARK: - Init

    init(repository: ListProductRepositoryProtocol) {
        self.repository = repository
    }
}

// MARK: - ListInteractorInput

extension ListInteractor: ListInteractorInput {
    func obtainProductsList() async {
        do {
            let data = try await repository.fetchListProducts()
            let products = preparedData(data)
            output?.setSuccessObtainData(products)
        } catch {
            output?.setFailedObtainData(error: error)
        }
    }

    func preparedData(_ inputs: [ListProduct]) -> [Product] {
        return inputs.map { Product($0) }
    }
}
