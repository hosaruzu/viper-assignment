//
//  ListView.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import UIKit
import Utilities

protocol CollectionViewDelegate: AnyObject {
    func didSelectItem()
}

final class CollectionView: UIView {

    // MARK: - Subviews

    private var collectionView: UICollectionView!

    // MARK: - Collection View Data Source

    private enum Section { case main }
    private let mockData = [1, 2, 3, 4, 5, 6]
    private var dataSource: UICollectionViewDiffableDataSource<Section, Int>!

    // MARK: - ListViewDelegate

    weak var delegate: CollectionViewDelegate?

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        setupLayout()
        setupDataSource()
        setupSnapshot()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Collection View

private extension CollectionView {
    func setupCollectionView() {
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionView.makeLayoutWithTwoColumns()
        )
        collectionView.register(ProductCell.self)
        collectionView.delegate = self
    }

    func setupLayout() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func setupDataSource() {
        dataSource = .init(collectionView: collectionView, cellProvider: { collectionView, indexPath, _ in
            let cell = collectionView.dequeue(ProductCell.self, for: indexPath)
            cell.setup()
            return cell
        })
    }

    private func setupSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(mockData, toSection: .main)
        dataSource.apply(snapshot)
    }
}

// MARK: - UICollectionViewDelegate

extension CollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        delegate?.didSelectItem()
    }
}
