//
//  ReuseIdentifiable.swift
//  Utilities
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import UIKit

public protocol ReuseIdentrifiable {
    static var reuseIdentifier: String { get }
}

public extension ReuseIdentrifiable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReuseIdentrifiable {}

// MARK: - UICollectionView + ReuseIdentrifiable

public extension UICollectionView {
    func dequeue<T: UICollectionViewCell>(
        _ cellType: T.Type,
        for indexPath: IndexPath
    ) -> T {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: cellType.reuseIdentifier,
            for: indexPath) as? T else {
            fatalError("Can't dequeue \(cellType.self) as \(self) cell")
        }
        return cell
    }

    func register<T: UICollectionViewCell>(_ cellType: T.Type) {
        register(cellType, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
}
