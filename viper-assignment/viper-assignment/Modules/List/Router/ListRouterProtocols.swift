//
//  ListRouterProtocols.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import Foundation

protocol ListRouterInput: AnyObject {
    func pushToDetail(_ id: String) -> DetailModuleInput
}
