//
//  ListViewController.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import UIKit

final class ListViewController: UIViewController {

    var output: ListViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }

}

// MARK: - ListView Conformance

extension ListViewController: ListView {
    func set(state: ListViewState) {
        switch state {
        case .loading: break
        case .success: break
        case .error: break
        }
    }

}
