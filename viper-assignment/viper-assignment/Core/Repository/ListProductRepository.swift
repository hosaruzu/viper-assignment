//
//  ListProductRepository.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 03.07.2024.
//

import CoreData

protocol ListProductRepositoryProtocol {
    func fetchListProducts() async throws -> [ListProduct]
}

final class ListProductRepository: ListProductRepositoryProtocol {

    private let requestManager: RequestManagerProtocol
    private let persistenceController: PersistenceController

    init(
        requestManager: RequestManagerProtocol = RequestManager(),
        persistenceController: PersistenceController = PersistenceController.shared
    ) {
        self.requestManager = requestManager
        self.persistenceController = persistenceController
    }

    func fetchListProducts() async throws -> [ListProduct] {
        do {
            let cached = try loadCachedProducts()
            guard !cached.isEmpty else {
                let products: ListProductsContainer = try await requestManager.perform(ListRequest.getProductList)
                saveToCache(products.advertisements)
                return products.advertisements
            }
            return cached
                .map { getModel(from: $0) }
                .shuffled()
        } catch {
            print("Error fetching products: \(error.localizedDescription)")
            throw error
        }
    }

    private func loadCachedProducts() throws -> [ListProductsEntity] {
        let request: NSFetchRequest<ListProductsEntity> = ListProductsEntity.fetchRequest()
        return try persistenceController.viewContext.fetch(request)
    }

    private func saveToCache(_ products: [ListProduct]) {
        let context = persistenceController.viewContext
        context.perform {
            for product in products {
                let productEntity = ListProductsEntity(context: context)
                self.map(product, toEntity: productEntity)
            }
            do {
                try context.save()
            } catch {
                print("Error saving to Core Data: \(error.localizedDescription)")
            }
        }
    }

    private func map(_ product: ListProduct, toEntity entity: ListProductsEntity) {
        entity.id = product.id
        entity.title = product.title
        entity.price = product.price
        entity.location = product.location
        entity.imageUrl = product.imageUrl
        entity.createdDate = product.createdDate
    }

    private func getModel(from entity: ListProductsEntity) -> ListProduct {
        return ListProduct(
            id: entity.id ?? "",
            title: entity.title ?? "",
            price: entity.price ?? "",
            location: entity.location ?? "",
            imageUrl: entity.imageUrl ?? "",
            createdDate: entity.createdDate ?? "")
    }
}
