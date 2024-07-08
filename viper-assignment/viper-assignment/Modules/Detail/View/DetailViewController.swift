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
    private let loaderView = LoaderView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        setupAppearance()
        setupSubviews()
        setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .never
    }
}

// MARK: - Setup appearance

private extension DetailViewController {
    func setupAppearance() {
        view.backgroundColor = .systemBackground
    }
}

// MARK: - Setup layout

private extension DetailViewController {
    func setupSubviews() {
        view.addSubview(detailView)
        view.addSubview(loaderView)
    }

    func setupConstraints() {
        detailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        loaderView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

// MARK: - DetailViewPresentable

extension DetailViewController: DetailViewPresentable {
    func set(state: DetailViewState) {
        switch state {
        case .loading:
            loaderView.start()
        case .success(let data):
            loaderView.stop()
            detailView.setup(with: data)
        case .error(let description):
            print(description)
        }
    }
}
