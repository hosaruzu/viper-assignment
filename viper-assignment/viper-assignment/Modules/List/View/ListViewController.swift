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
    private var errorView = ErrorView()

    // MARK: - Lifecyce

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        setupAppearance()
        addSubviews()
        setupConstraints()
        setupDelegates()
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
        view.addSubview(errorView)

    }

    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        loaderView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        errorView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - Setup Delegates

private extension ListViewController {
    func setupDelegates() {
        collectionView.delegate = self
        errorView.delegate = self
    }
}

// MARK: - ColelctionView Conformance

extension ListViewController: ListViewPresentable {
    func set(state: ListViewState) {
            switch state {
            case .loading:
                loaderView.start()
            case .success(let data):
                loaderView.stop()
                collectionView.setupWith(data)
            case .error:
                loaderView.stop()
                errorView.show()
            }
    }
}

// MARK: - CollectionViewDelegate

extension ListViewController: CollectionViewDelegate {
    func didSelectItem() {
        output.didTapOnItem()
    }
}

// MARK: - ErrorViewDelegate

extension ListViewController: ErrorViewDelegate {
    func didTapButton() {
        output.viewDidLoad()
        loaderView.start()
        errorView.hide()
    }
}
