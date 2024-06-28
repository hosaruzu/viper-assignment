//
//  DetailViewController.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import UIKit

final class DetailViewController: UIViewController {

    var output: DetailViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }
}

// MARK: - DetailViewPresentable

extension DetailViewController: DetailViewPresentable {
    func setup(with: String) {
        //
    }
}
