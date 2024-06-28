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
        label.font = .systemFont(ofSize: Spec.Title.fontSize, weight: .medium)
        label.textColor = .label
        label.text = "Something went wrong"
        return label
    }()

    private let errorButton: UIButton = {
        let button = UIButton(type: .system)
        let text = NSAttributedString(
            string: "Try again",
            attributes: [.font: UIFont.systemFont(ofSize: Spec.Button.fontSize, weight: .semibold)])
        button.setAttributedTitle(text, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = Spec.Button.cornerRadius
        return button
    }()

    private let vStack: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = Spec.Stack.defaultSpacing
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
        UIView.animate(withDuration: Spec.Animation.duration) {
            self.isHidden = false
            self.alpha = 1
        }

    }

    func hide() {
        UIView.animate(withDuration: Spec.Animation.duration) {
            self.isHidden = true
            self.alpha = 0
        }
    }
}

// MARK: - Setup Appearance

private extension ErrorView {
    func setupAppearance() {
//        backgroundColor = .systemBackground
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
        errorButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(Spec.Button.height)
        }

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
   enum Stack {
       static let defaultSpacing: CGFloat = 12
    }

    enum Title {
        static let fontSize: CGFloat = 18
    }

    enum Button {
        static let fontSize: CGFloat = 16
        static let cornerRadius: CGFloat = 12
        static let height: CGFloat = 44
    }

    enum Animation {
        static let duration: Double = 0.3
    }
}
