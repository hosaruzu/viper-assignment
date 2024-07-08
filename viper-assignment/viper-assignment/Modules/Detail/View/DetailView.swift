//
//  DetailView.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 28.06.2024.
//

import UIKit
import Kingfisher

final class DetailView: UIView {

    // MARK: - Subviews

    private let detailImageView = VAImageView()
    private let detailPriceLabel = VALabel(font: .titleDetail, textColor: .title)
    private let detailTitleLabel = VALabel(font: .titleDetail, textColor: .title)
    private let detailAddressLabel = VALabel(font: .bodyDetail, textColor: .title)
    private let detailDescriptionLabel = VALabel(font: .titleDetail, textColor: .title)
    private let detailDescriptionBodyLabel = VALabel(font: .bodyDetail, textColor: .title)
    private let detailMailLabel = VALabel(font: .captionDetail, textColor: .subtitle)
    private let detailPhoneLabel = VALabel(font: .captionDetail, textColor: .subtitle)

    private let vStack: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = Spec.Stack.defaultSpacing
        return vStack
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public

    func setup(with product: DetailProduct) {
        detailImageView.kf.setImage(with: URL(string: product.imageUrl))
        detailPriceLabel.text = product.price
        detailTitleLabel.text = product.title
        detailAddressLabel.text = product.location
        detailDescriptionBodyLabel.text = product.description
        detailMailLabel.text = product.email
        detailPhoneLabel.text = product.phoneNumber
    }
}

// MARK: - Setup appearance

private extension DetailView {
    func setupAppearance() {
        backgroundColor = .systemBackground
        detailDescriptionLabel.text = "Description"
        detailDescriptionBodyLabel.numberOfLines = 0
    }
}

// MARK: - Setup layout

private extension DetailView {
    func setupSubviews() {
        vStack.addArrangedSubview(detailPriceLabel)
        vStack.addArrangedSubview(detailTitleLabel)
        vStack.addArrangedSubview(detailAddressLabel)
        vStack.addArrangedSubview(detailDescriptionLabel)
        vStack.addArrangedSubview(detailDescriptionBodyLabel)
        vStack.addArrangedSubview(detailMailLabel)
        vStack.addArrangedSubview(detailPhoneLabel)

        vStack.setCustomSpacing(Spec.Stack.mailCustomSpacing, after: detailMailLabel)
        vStack.setCustomSpacing(Spec.Stack.addressCustomSpacing, after: detailAddressLabel)

        addSubview(detailImageView)
        addSubview(vStack)
    }

    func setupConstraints() {
        detailImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(Spec.Image.heightRatio)
        }

        vStack.snp.makeConstraints { make in
            make.top.equalTo(detailImageView.snp.bottom).offset(Spec.Stack.topOffset)
            make.horizontalEdges.equalToSuperview().inset(Spec.Stack.horizontalOffset)
        }
    }
}

// MARK: - UI constants

private enum Spec {
    enum Stack {
        static let defaultSpacing: CGFloat = 6
        static let addressCustomSpacing: CGFloat = 12
        static let mailCustomSpacing: CGFloat = 0
        static let topOffset: CGFloat = 16
        static let horizontalOffset: CGFloat = 8
    }

    enum Image {
        static let heightRatio: CGFloat = 0.5
    }
}
