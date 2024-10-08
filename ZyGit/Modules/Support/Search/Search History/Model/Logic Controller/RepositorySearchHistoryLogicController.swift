//
//  RepositorySearchHistoryLogicController.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

final class RepositorySearchHistoryLogicController: SearchHistoryLogicController {
    
    // MARK: - Properties
    
    typealias ModelType = RepositoryModel
    
    var dataPersistenceManager = SearchHistoryManager.standard
    var model = Observable<Array<RepositoryModel>>()
    var queryModel = Observable<Array<String>>()
    
    // MARK: - Initialization
    
    init() {
        dataPersistenceManager.activeSearchContext = .repositories
        bindToPersistedData()
    }
    
    // MARK: - Bind to Persisted Data Method

    func bindToPersistedData() {
        dataPersistenceManager.bindRepositories { [weak self] repositoryHistory in
            if let repositoryHistory = repositoryHistory {
                self?.modelArray = repositoryHistory.objects
                self?.queryModelArray = repositoryHistory.queries
            }
        }
    }
    
}
