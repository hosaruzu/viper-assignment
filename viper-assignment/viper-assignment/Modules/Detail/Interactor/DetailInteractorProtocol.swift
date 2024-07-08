//
//  DetailInteractorProtocol.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 06.07.2024.
//

protocol DetailInteractorInput: AnyObject {
    func obtainProduct(_ id: String) async throws
}

protocol DetailInteractorOutput: AnyObject {
    func setSuccessObtainData(_ data: DetailProduct)
    func setFailedObtainData(error: Error)
}
