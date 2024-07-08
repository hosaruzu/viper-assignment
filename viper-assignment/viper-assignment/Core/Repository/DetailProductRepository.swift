//
//  DetailProductRepository.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 06.07.2024.
//

import Foundation
import CoreData

protocol DetailProductRepositoryProtocol {
    func fetchProduct(_ id: String) async throws -> DetailProduct
}

final class DetailProductRepository: DetailProductRepositoryProtocol {

    private let requestManager: RequestManagerProtocol
    private let persistenceController: PersistenceController

    init(
        requestManager: RequestManagerProtocol = RequestManager(),
        persistenceController: PersistenceController = PersistenceController.shared
    ) {
        self.requestManager = requestManager
        self.persistenceController = persistenceController
    }

    func fetchProduct(_ id: String) async throws -> DetailProduct {
        do {
            let cached = try loadCachedDetailProducts()
            guard cached.contains(where: { $0.id == id }) else {
                let product: DetailProduct = try await requestManager.perform(DetailRequest.getDetail(id))
                saveToCache(product)
                return product
            }
            guard let result = cached.first(where: { $0.id == id }) else {
                throw NetworkError.invalidServerResponse
            }
            return getModel(from: result)
        } catch {
            print("Error fetching products: \(error.localizedDescription)")
            throw error
        }
    }

    private func loadCachedDetailProducts() throws -> [DetailProductEntity] {
        let request: NSFetchRequest<DetailProductEntity> = DetailProductEntity.fetchRequest()
        return try persistenceController.viewContext.fetch(request)
    }

    private func saveToCache(_ product: DetailProduct) {
        let context = persistenceController.viewContext
        context.perform {
            let productEntity = DetailProductEntity(context: context)
            self.map(product, toEntity: productEntity)
            do {
                try context.save()
            } catch {
                print("Error saving to Core Data: \(error.localizedDescription)")
            }
        }
    }

    private func map(_ product: DetailProduct, toEntity entity: DetailProductEntity) {
        entity.id = product.id
        entity.title = product.title
        entity.price = product.price
        entity.location = product.location
        entity.imageUrl = product.imageUrl
        entity.createdDate = product.createdDate
        entity.descriptionDetail = product.description
        entity.email = product.email
        entity.phoneNumber = product.phoneNumber
        entity.address = product.address
    }

    private func getModel(from entity: DetailProductEntity) -> DetailProduct {
        return DetailProduct(
            id: entity.id ?? "",
            title: entity.title ?? "",
            price: entity.price ?? "",
            location: entity.location ?? "",
            imageUrl: entity.imageUrl ?? "",
            createdDate: entity.createdDate ?? "",
            description: entity.descriptionDetail ?? "",
            email: entity.email ?? "",
            phoneNumber: entity.phoneNumber ?? "",
            address: entity.address ?? "")
    }
}
