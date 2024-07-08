//
//  DetailPresenter.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import Foundation

final class DetailPresenter {

    // MARK: - Modules

    unowned var view: DetailViewInput
    private let interactor: DetailInteractorInput

    // MARK: - Detail Id from outside

    let id: String

    // MARK: - Init

    init(
        id: String,
        view: DetailViewInput,
        interactor: DetailInteractorInput
    ) {
        self.id = id
        self.view = view
        self.interactor = interactor
    }
}

// MARK: - View output

extension DetailPresenter: DetailViewOutput {
    func viewDidLoad() {
        Task {
            try await interactor.obtainProduct(id)
        }
    }
}

// MARK: - Interactor output

extension DetailPresenter: DetailInteractorOutput {
    func setSuccessObtainData(_ data: DetailProduct) {
        Task { @MainActor in
            view.set(state: .success(data: data))
        }
    }

    func setFailedObtainData(error: any Error) {
        view.set(state: .error(description: "Error occured"))
    }

}

// MARK: - Module output (data back flow)

extension DetailPresenter: DetailModuleInput {}
