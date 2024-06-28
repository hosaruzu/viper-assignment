//
//  LoaderView.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 28.06.2024.
//

import UIKit

final class LoaderView: UIView {

    // MARK: - Subviews

    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
        start()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public

    func start() {
        activityIndicator.startAnimating()
    }

    func stop() {
        activityIndicator.stopAnimating()
    }
}

// MARK: - Setup layout

private extension LoaderView {
    func setupSubviews() {
        addSubview(activityIndicator)
    }

    func setupConstraints() {
        activityIndicator.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
