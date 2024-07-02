//
//  ProductCell.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import UIKit

final class ProductCell: UICollectionViewCell {

    // MARK: - Subviews

    private let productImageView = VAImageView(isRounded: true)
    private let productNameLabel = VALabel(font: .titleList, textColor: .title)
    private let productPriceLabel = VALabel(font: .priceList, textColor: .title)
    private let cityLabel = VALabel(font: .bodyList, textColor: .subtitle)
    private let dateLabel = VALabel(font: .bodyList, textColor: .subtitle)

    private let vStack = UIStackView()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupAdditionalAppearance()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public

    func setup() {
        productImageView.image = .phoneMock
        productNameLabel.text = "Смартфон iPhone 15 Pro Max"
        productPriceLabel.text = "95000 RUB"
        cityLabel.text = "Moscow"
        dateLabel.text = "2024-02-04"
    }
}

// MARK: - Setup layout

private extension ProductCell {
    func setupSubviews() {
        vStack.addArrangedSubview(productImageView)
        vStack.addArrangedSubview(productNameLabel)
        vStack.addArrangedSubview(productPriceLabel)
        vStack.addArrangedSubview(cityLabel)
        vStack.addArrangedSubview(dateLabel)

        contentView.addSubview(vStack)
    }

    func setupAdditionalAppearance() {
        vStack.axis = .vertical
        vStack.spacing = Spec.Stack.defaultSpacing
        vStack.setCustomSpacing(0, after: cityLabel)

        productNameLabel.numberOfLines = 0
    }

    func setupConstraints() {
        productImageView.snp.makeConstraints {
            $0.height.equalTo(Spec.Image.height)
        }

        vStack.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
        }
    }
}

// MARK: - UI constants

private enum Spec {
    enum Stack {
        static let defaultSpacing: CGFloat = 8
    }

   enum Image {
       static let height: CGFloat = 170
    }
}
