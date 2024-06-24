//
//  TransitionHandler.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import UIKit

protocol TransitionHandler: AnyObject {
    func pushToModule(viewController: UIViewController)
}

extension TransitionHandler where Self: UIViewController {

    func pushToModule(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
