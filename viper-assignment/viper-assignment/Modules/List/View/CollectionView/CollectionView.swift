//
//  ListView.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import UIKit

protocol CollectionViewDelegate: AnyObject {
    func didSelectItem(_ id: String)
    func didTriggerRefresh()
}

final class CollectionView: UIView {

    // MARK: - Subviews

    private var collectionView: UICollectionView!
    private let emptyStateLabel: UILabel = {
        let label = UILabel()
        label.text = "No results"
        label.font = .preferredFont(forTextStyle: .footnote)
        label.isHidden = true
        return label
    }()
    private let refreshControl = UIRefreshControl()

    // MARK: - Collection View Data Source

    private enum Section { case main }
    private var data: [Product] = [] {
        didSet {
            emptyStateLabel.isHidden = !data.isEmpty
        }
    }
    private var dataSource: UICollectionViewDiffableDataSource<Section, Product>!
    private var dataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, Product>()

    // MARK: - ListViewDelegate

    weak var delegate: CollectionViewDelegate?

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        setupLayout()
        setupDataSource()
        setupSnapshot()
        setupRefreshControl()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupWith(_ data: [Product]) {
        self.data = data
        updateSnapshot()
        refreshControl.endRefreshing()
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

    func setupRefreshControl() {
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(triggerRefreshControl), for: .valueChanged)
    }

    @objc
    func triggerRefreshControl() {
        delegate?.didTriggerRefresh()
    }

    func setupLayout() {
        addSubview(collectionView)
        addSubview(emptyStateLabel)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        emptyStateLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    func setupDataSource() {
        dataSource = .init(collectionView: collectionView, cellProvider: { collectionView, indexPath, product in
            let cell = collectionView.dequeue(ProductCell.self, for: indexPath)
            cell.setup(with: product)
            return cell
        })
    }

    private func setupSnapshot() {
        dataSourceSnapshot.appendSections([.main])
    }

    private func updateSnapshot() {
        let diff = data.difference(from: dataSourceSnapshot.itemIdentifiers)
        let currentIdentifiers = dataSourceSnapshot.itemIdentifiers
        guard let newIdentifiers = currentIdentifiers.applying(diff) else {
            return
        }
        dataSourceSnapshot.deleteItems(currentIdentifiers)
        dataSourceSnapshot.appendItems(newIdentifiers)
        if refreshControl.isRefreshing {
            dataSource.apply(dataSourceSnapshot, animatingDifferences: false)
        } else {
            dataSource.apply(dataSourceSnapshot, animatingDifferences: true)
        }
    }
}

// MARK: - UICollectionViewDelegate

extension CollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        let id = data[indexPath.item].id
        delegate?.didSelectItem(id)
    }
}
