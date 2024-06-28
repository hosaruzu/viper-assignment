//
//  DetailAssembly.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import Foundation

final class DetailAssembly {
    static func build(view: DetailViewPresentable) -> DetailModuleInput {
        let presenter = DetailPresenter(view: view)
        view.output = presenter
        return presenter
    }
}
