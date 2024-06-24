//
//  ListViewProtocol.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import Foundation

protocol ListViewInput: AnyObject {
    func set(state: ListViewState)
}

protocol ListViewOutput: AnyObject {
    func viewDidLoad()
}

protocol ListViewPresentable: ListViewInput, TransitionHandler {
    var output: ListViewOutput! { get set }
}

enum ListViewState {
    case loading
    case success
    case error
}
