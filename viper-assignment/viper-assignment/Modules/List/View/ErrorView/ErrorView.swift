//
//  ErrorView.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 28.06.2024.
//

import UIKit

protocol ErrorViewDelegate: AnyObject {
    func didTapButton()
}

final class ErrorView: UIView {

    // MARK: - Subviews

    private let errorTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .label
        label.text = "Something went wrong"
        return label
    }()

    private let errorButton: UIButton = {
        let button = UIButton(type: .system)
        let text = NSAttributedString(
            string: "Try again",
            attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .semibold)])
        button.setAttributedTitle(text, for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()

    private let vStack: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = Spec.vStackDefaultSpacing
        vStack.alignment = .center
        return vStack
    }()

    // MARK: - Delegate

    weak var delegate: ErrorViewDelegate?

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
        setupSubviews()
        setupConstraints()
        setupButtonAction()
        hide()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public

    func show() {
        UIView.animate(withDuration: 0.3) {
            self.isHidden = false
            self.alpha = 1
        }

    }

    func hide() {
        UIView.animate(withDuration: 0.3) {
            self.isHidden = true
            self.alpha = 0
        }
    }
}

// MARK: - Setup Appearance

private extension ErrorView {
    func setupAppearance() {
        backgroundColor = .systemBackground
    }
}

// MARK: - Setup layout

private extension ErrorView {
    func setupSubviews() {
        vStack.addArrangedSubview(errorTitleLabel)
        vStack.addArrangedSubview(errorButton)

        addSubview(vStack)
    }

    func setupConstraints() {
        vStack.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

    }
}

// MARK: - Setup button

private extension ErrorView {
    func setupButtonAction() {
        errorButton.addTarget(self, action: #selector(buttonTap(_:)), for: .touchUpInside)
    }

    @objc
    func buttonTap(_ sender: UIButton) {
        delegate?.didTapButton()
    }
}

// MARK: - UI constants

private enum Spec {
    static let imageViewWidth: CGFloat = 56
    static let imageViewHeight: CGFloat = 56
    static let vStackDefaultSpacing: CGFloat = 12
    static let imageToTitleOffset: CGFloat = 8
}
