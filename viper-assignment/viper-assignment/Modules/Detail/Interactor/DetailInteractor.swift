//
//  DetailInteractor.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 06.07.2024.
//

import Foundation

final class DetailInteractor {

    // MARK: - Dependencies

    private let repository: DetailProductRepositoryProtocol

    // MARK: - Interactor output

    weak var output: DetailInteractorOutput?

    // MARK: - Init

    init(repository: DetailProductRepositoryProtocol) {
        self.repository = repository
    }
}

// MARK: - ListInteractorInput

extension DetailInteractor: DetailInteractorInput {
    func obtainProduct(_ id: String) async throws {
        do {
            let data = try await repository.fetchProduct(id)
            output?.setSuccessObtainData(data)
        } catch {
            print(error.localizedDescription)
            output?.setFailedObtainData(error: error)
        }
    }
}
