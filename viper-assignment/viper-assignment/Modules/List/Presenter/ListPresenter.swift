//
//  ListPresenter.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import Foundation

@MainActor
final class ListPresenter {

    // MARK: - Modules

    unowned var view: ListViewInput
    private let interactor: ListInteractorInput
    private let router: ListRouterInput

    private weak var detailScreen: DetailModuleInput?

    // MARK: - Data source

    private var data: [Product] = []

    // MARK: - Init

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

// MARK: - View output

extension ListPresenter: ListViewOutput {

    func viewDidLoad() {
        Task {
            view.set(state: .loading)
            try await interactor.obtainProductsList()
        }
    }

    func didTapOnItem(_ id: String) {
        detailScreen = router.pushToDetail(id)
    }

    func didSearchResultUpdateWith(_ text: String?) {
        guard let text,
              !text.isEmpty
        else {
            view.set(state: .success(data: self.data))
            return
        }
        let data = data.filter { $0.title.lowercased().contains(text.lowercased()) }
        view.set(state: .success(data: data))
    }
}

// MARK: - Interactor output

extension ListPresenter: ListInteractorOutput {

    func setSuccessObtainData(_ data: [Product]) {
        self.data = data
        setViewStateOnMainActor(.success(data: data))
    }

    func setFailedObtainData(error: Error) {
        setViewStateOnMainActor(.error(description: error.localizedDescription))
    }

    func didTriggerRefresh() {
        viewDidLoad()
    }

    func setViewStateOnMainActor(_ state: ListViewState) {
        Task {
            view.set(state: state)
        }
    }
}
