//
//  ListAssembly.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

final class ListAssembly {

    @MainActor static func build(with view: ListViewPresentable) {
        let repository = ListProductRepository()
        let interactor = ListInteractor(repository: repository)
        let router = ListRouter()
        let presenter = ListPresenter(
            view: view,
            interactor: interactor,
            router: router
        )

        view.output = presenter
        router.transitionHandler = view
        interactor.output = presenter
    }
}
