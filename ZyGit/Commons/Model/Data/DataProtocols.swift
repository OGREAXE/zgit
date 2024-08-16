//
//  DataProtocols.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

protocol DataPersistenceProvider { }

protocol DataPersistenceManager {
    
    associatedtype DataPersistenceProviderType: DataPersistenceProvider
    
    var dataPersistenceProvider: DataPersistenceProviderType { get }
    
}
