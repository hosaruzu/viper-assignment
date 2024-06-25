//
//  VALabel.swift
//  Utilities
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import UIKit

final public class VALabel: UILabel {

    public enum Font {
        case priceList
        case titleList
        case bodyList

        case titleDetail
        case bodyDetail
        case captionDetail
    }

    public enum TextColor {
        case title
        case subtitle
    }

    // MARK: - Init

    public init(font: Font, textColor: TextColor) {
        super.init(frame: .zero)
        setFont(with: font)
        setTextColor(with: textColor)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    func setFont(with fontKind: Font) {
        switch fontKind {
        case .priceList:
            font = Spec.priceListFont
        case .titleList:
            font = Spec.titleListFont
        case .bodyList:
            font = Spec.bodyListFont
        case .titleDetail:
            font = Spec.titleDetailFont
        case .bodyDetail:
            font = Spec.bodyDetailFont
        case .captionDetail:
            font = Spec.captionDetailFont
        }
    }

    func setTextColor(with color: TextColor) {
        switch color {
        case .title:
            textColor = .label
        case .subtitle:
            textColor = .secondaryLabel
        }
    }
}

// MARK: - UI constants

private enum Spec {
    static let titleColor: UIColor = .label
    static let secondaryColor: UIColor = .secondaryLabel

    static let titleListFont: UIFont = .systemFont(ofSize: 16, weight: .medium)
    static let priceListFont: UIFont = .systemFont(ofSize: 18, weight: .bold)
    static let bodyListFont: UIFont = .systemFont(ofSize: 14, weight: .regular)

    static let titleDetailFont: UIFont = .systemFont(ofSize: 20, weight: .bold)
    static let bodyDetailFont: UIFont = .systemFont(ofSize: 16, weight: .regular)
    static let captionDetailFont: UIFont = .systemFont(ofSize: 16, weight: .bold)
}
