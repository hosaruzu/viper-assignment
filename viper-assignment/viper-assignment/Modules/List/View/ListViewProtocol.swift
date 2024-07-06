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
    func didTapOnItem()
    func didTriggerRefresh()
    func didSearchResultUpdateWith(_ text: String?)
}

protocol ListViewPresentable: ListViewInput, TransitionHandler {
    var output: ListViewOutput! { get set }
}

enum ListViewState {
    case loading
    case success(data: [Product])
    case error(description: String)
}
