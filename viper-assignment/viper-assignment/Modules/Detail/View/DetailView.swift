//
//  DetailView.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 28.06.2024.
//

import UIKit

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
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public
    // Setup with mock data now, set real after creating network request
    func setup() {
        detailImageView.image = .phoneMock
        detailPriceLabel.text = "95 000"
        detailTitleLabel.text = "iPhone 15 Pro Max Space Gray"
        detailAddressLabel.text = "DC, Linkoln memorial"
        detailDescriptionLabel.text = "Description"
        detailDescriptionBodyLabel.text = "iPhone 15 Pro Max Space Gray description will be here"
        detailMailLabel.text = "Почта: somemail@example.com"
        detailPhoneLabel.text = "Телефон: 8 999 999 99 99"
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
