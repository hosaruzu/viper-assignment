//
//  DetailViewProtocol.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import Foundation

protocol DetailViewInput: AnyObject {
    func set(state: DetailViewState)
}

protocol DetailViewOutput: AnyObject {
    func viewDidLoad()
}

protocol DetailViewPresentable: DetailViewInput {
    var output: DetailViewOutput! { get set }
}

enum DetailViewState {
    case loading
    case success(data: DetailProduct)
    case error(description: String)
}
