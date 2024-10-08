//
//  BundlePersistenceProvider.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

class BundlePersistenceProvider: DataPersistenceProvider {
    
    private let bundle = Bundle.main
    
    // MARK: - Resource Loading Methods
    
    func loadResource(title: String, withExtension: String) -> Result<Data,BundleError> {
        if let url = Bundle.main.url(forResource: title, withExtension: withExtension) {
            do {
                let data = try Data(contentsOf: url, options: .mappedIfSafe)
                return .success(data)
            } catch {
                return .failure(.resourceReadingFailed(error))
            }
        }
        return .failure(.invalidResourceURL)
    }
    
}
