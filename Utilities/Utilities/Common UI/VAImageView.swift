//
//  VAImageView.swift
//  Utilities
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import UIKit

final public class VAImageView: UIImageView {

    // MARK: - Init

    public init(isRounded: Bool) {
       super.init(frame: .zero)
        setup(isRounded: isRounded)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    func setup(isRounded: Bool) {
        layer.masksToBounds = true
        if isRounded {
            layer.cornerRadius = 8
        } else {
            layer.cornerRadius = 0
        }
    }
}
