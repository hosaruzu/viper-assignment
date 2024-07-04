//
//  ProductCell.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import Kingfisher
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

    override func prepareForReuse() {
        productImageView.image = nil
        productNameLabel.text = nil
        productPriceLabel.text = nil
        cityLabel.text = nil
        dateLabel.text = nil
    }

    // MARK: - Public

    func setup(with product: Product) {
        setupImage(with: product.imageUrl)
        productImageView.kf.indicatorType = .activity
        productNameLabel.text = product.title
        productPriceLabel.text = product.price
        cityLabel.text = product.location
        dateLabel.text = product.createdDate
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

        contentView.addSubview(productImageView)
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
            $0.top.horizontalEdges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(Spec.Image.height)
        }

        vStack.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }

    private func setupImage(with url: URL?) {
        let processor = ResizingImageProcessor(referenceSize: Spec.Image.scalingSize)
        productImageView.kf.setImage(with: url, options: [.processor(processor)])
    }
}

// MARK: - UI constants

private enum Spec {
    enum Stack {
        static let defaultSpacing: CGFloat = 8
    }

   enum Image {
       static let height: CGFloat = 170
       static let scalingSize: CGSize = CGSize(width: 100, height: 170)
    }
}
