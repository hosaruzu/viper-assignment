//
//  ListInteractorProtocol.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 24.06.2024.
//

import Foundation

protocol ListInteractorInput: AnyObject {
    func obtainProductsList()
}

protocol ListInteractorOutput: AnyObject {
    func setSuccessObtainData()
    func setFailedObtainData(error: Error)
}
