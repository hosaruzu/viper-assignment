//
//  ListInteractorProtocol.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import NetworkKit

protocol ListInteractorInput: AnyObject {
    func obtainProductsList() async throws
}

protocol ListInteractorOutput: AnyObject {
    func setSuccessObtainData(_ data: ListProductsContainer)
    func setFailedObtainData(error: Error)
}
