//
//  DetailPresenter.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import Foundation

final class DetailPresenter {

    unowned var view: DetailViewInput
    private let interactor: DetailInteractorInput

    let id: String

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

extension DetailPresenter: DetailViewOutput {
    func viewDidLoad() {
        Task {
            try await interactor.obtainProduct(id)
        }
    }
}

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

extension DetailPresenter: DetailModuleInput {

}
