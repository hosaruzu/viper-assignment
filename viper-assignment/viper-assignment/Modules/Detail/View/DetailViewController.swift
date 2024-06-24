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

extension DetailViewController: DetailView {
    func setup(with: String) {
        //
    }
}
