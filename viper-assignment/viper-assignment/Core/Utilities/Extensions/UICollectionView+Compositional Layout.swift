//
//  UICollectionView+Compositional Layout.swift
//  Utilities
//
//  Created by Artem Tebenkov on 26.06.2024.
//

import UIKit

extension UICollectionView {
    public static func makeLayoutWithTwoColumns() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(Spec.cellHeight))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: Spec.numberOfCells)
        group.interItemSpacing = .fixed(Spec.layoutSpacing)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 0,
            leading: Spec.layoutSpacing,
            bottom: 0,
            trailing: Spec.layoutSpacing)
        section.interGroupSpacing = Spec.layoutSpacing

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

private enum Spec {
    static let layoutSpacing: CGFloat = 16
    static let cellHeight: CGFloat = 280
    static let numberOfCells: Int = 2
}
