//
//  ListAssembly.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import Foundation

final class ListAssembly {

    static func build(with view: ListViewPresentable) {
        let interactor = ListInteractor()
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
