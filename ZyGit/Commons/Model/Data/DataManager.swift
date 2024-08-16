//
//  DataManager.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

class DataManager {
    
    // MARK: - Properties
    
    static let standard = DataManager()
    var isSetup: Bool = false
    
    // MARK: - Persistence Providers
    
    let bundlePersistenceProvider = BundlePersistenceProvider()
    let realmDataPersistenceProvider = RealmPersistenceProvider()
    let fileManagerPersistenceProvider = FileManagerPersistenceProvider()
    let userDefaultsPersistenceProvider = UserDefaultsPersistenceProvider()
    
    // MARK: Initialization
    
    private init() {}
    
    // MARK: Setup Methods
    
    func setup(completionHandler: @escaping ((DataError?) -> Void)) {
        isSetup = true
        userDefaultsPersistenceProvider.setup()
    }
    
    // MARK: - Save and Load Methods
    
    func saveData() throws {
        do {
            try SearchHistoryManager.standard.save()
        } catch {
            if let error = error as? RealmError {
                throw DataError.realm(error)
            } else if let error = error as? FileManagerError {
                throw DataError.fileManager(error)
            }
        }
    }
    
    func loadData() throws {
        do {
            try SearchHistoryManager.standard.load()
        } catch {
            if let error = error as? RealmError {
                throw DataError.realm(error)
            } else if let error = error as? FileManagerError {
                throw DataError.fileManager(error)
            }
        }
    }
    
    // MARK: - Clear Methods
    
    // Clears stored data without removing UserDefaults keys
    @MainActor func clearData() throws {
        
    }
    
    // Clears all stored data including UserDefaults keys
    @MainActor func clearAllData() throws {
        isSetup = false
        do {
            // Clear data stored in Memory
            SearchHistoryManager.standard.clearAll()
            
            // Clear data stored in Storage
            try realmDataPersistenceProvider.clear()
            fileManagerPersistenceProvider.clear()
            userDefaultsPersistenceProvider.clear()
        } catch let error as RealmError {
            throw DataError.realm(error)
        }
    }
    
}
