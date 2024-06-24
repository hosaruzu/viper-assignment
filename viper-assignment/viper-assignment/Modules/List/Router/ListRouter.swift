//
//  ListRouter.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import Foundation

final class ListRouter {
    weak var transitionHandler: TransitionHandler?
}

extension ListRouter: ListRouterInput {
    func pushToDetail() -> DetailModuleInput {
        let viewController = DetailViewController()
        let detailInput = DetailAssembly.build(view: viewController)
        transitionHandler?.pushToModule(viewController: viewController)
        return detailInput
    }
}
