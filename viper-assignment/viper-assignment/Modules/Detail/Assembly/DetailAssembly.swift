//
//  DetailAssembly.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import Foundation

final class DetailAssembly {
    static func build(view: DetailViewPresentable, id: String) -> DetailModuleInput {
        let repository = DetailProductRepository()
        let interactor = DetailInteractor(repository: repository)
        let presenter = DetailPresenter(id: id, view: view, interactor: interactor)
        view.output = presenter
        interactor.output = presenter
        return presenter
    }
}
