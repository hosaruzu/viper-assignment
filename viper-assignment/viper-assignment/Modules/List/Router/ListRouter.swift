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
    func pushToDetail() {
//        transitionHandler?.pushToModule(viewController: <#T##UIViewController#>)
    }
}
