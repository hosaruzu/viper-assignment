//
//  ListViewController.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import UIKit
import SnapKit

final class ListViewController: UIViewController {

    // MARK: - View Output

    var output: ListViewOutput!

    // MARK: - Subviews

    private var collectionView = CollectionView()
    private var loaderView = LoaderView()

    // MARK: - Lifecyce

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        setupAppearance()
        addSubviews()
        setupConstraints()

        collectionView.delegate = self
    }
}

// MARK: - Setup appearance

private extension ListViewController {
    func setupAppearance() {
        title = "Products"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
}

// MARK: - Setup layout

private extension ListViewController {
    private func addSubviews() {
        view.addSubview(collectionView)
        view.addSubview(loaderView)
    }

    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        loaderView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - ColelctionView Conformance

extension ListViewController: ListViewPresentable {
    func set(state: ListViewState) {
        switch state {
        case .loading: break
        case .success: break
        case .error: break
        }
    }

}

extension ListViewController: CollectionViewDelegate {
    func didSelectItem() {
        print("item selected")
    }
}
