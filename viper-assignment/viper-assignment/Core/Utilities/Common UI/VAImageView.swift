//
//  VAImageView.swift
//  Utilities
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import UIKit

final class VAImageView: UIImageView {

    // MARK: - Init

    public init(cornerRadius: CGFloat = 0) {
       super.init(frame: .zero)
        setup(cornerRadius: cornerRadius)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    func setup(cornerRadius: CGFloat) {
        clipsToBounds = true
        contentMode = .scaleAspectFill
        layer.cornerRadius = cornerRadius
    }
}
