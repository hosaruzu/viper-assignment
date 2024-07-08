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

    private let detailImageView = VAImageView(isRounded: false)
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
        vStack.spacing = 6
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
        detailDescriptionLabel.text = "Description"
        detailDescriptionBodyLabel.text = product.description
        detailMailLabel.text = product.email
        detailPhoneLabel.text = product.phoneNumber
    }
}

// MARK: - Setup appearance

private extension DetailView {
    func setupAppearance() {
        backgroundColor = .systemBackground
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

        vStack.setCustomSpacing(0, after: detailMailLabel)
        vStack.setCustomSpacing(12, after: detailAddressLabel)
        detailDescriptionBodyLabel.numberOfLines = 0

        addSubview(detailImageView)
        addSubview(vStack)
    }

    func setupConstraints() {
        detailImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }

        vStack.snp.makeConstraints { make in
            make.top.equalTo(detailImageView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(8)
        }
    }
}
