//
//  ListPresenter.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import Foundation

final class ListPresenter {

    unowned var view: ListViewInput
    private let interactor: ListInteractorInput
    private let router: ListRouterInput

    private weak var detailScreen: DetailModuleInput?

    init(
        view: ListViewInput,
        interactor: ListInteractorInput,
        router: ListRouterInput
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ListPresenter: ListViewOutput {

    func viewDidLoad() {
        //
    }

    func didTapOnItem() {
       detailScreen = router.pushToDetail()
    }
}

extension ListPresenter: ListInteractorOutput {

    func setSuccessObtainData() {
        view.set(state: .success)
    }

    func setFailedObtainData(error: Error) {
        view.set(state: .error)
    }
}
