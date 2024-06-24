//
//  DetailPresenter.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import Foundation

final class DetailPresenter {

    unowned var view: DetailViewInput

    init(view: DetailViewInput) {
        self.view = view
    }
}

extension DetailPresenter: DetailViewOutput {
    func viewDidLoad() {
        //
    }
}

extension DetailPresenter: DetailModuleInput {

}
