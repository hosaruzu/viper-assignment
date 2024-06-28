//
//  DetailViewController.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import UIKit

final class DetailViewController: UIViewController {

    // MARK: - View output

    var output: DetailViewOutput!

    // MARK: - Subviews

    private let detailView = DetailView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        setupAppearance()
        setupSubviews()
        setupConstraints()
    }
}

// MARK: - Setup appearance

private extension DetailViewController {
    func setupAppearance() {
        view.backgroundColor = .systemBackground
        title = "Item name"
    }
}

// MARK: - Setup layout

private extension DetailViewController {
    func setupSubviews() {
        view.addSubview(detailView)
    }

    func setupConstraints() {
        detailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - DetailViewPresentable

extension DetailViewController: DetailViewPresentable {
    func setup(with: String) {
        //
    }
}
