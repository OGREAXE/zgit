//
//  UserSearchHistoryLogicController.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

final class UserSearchHistoryLogicController: SearchHistoryLogicController {
    
    // MARK: - Properties
    
    typealias ModelType = UserModel
    
    var dataPersistenceManager = SearchHistoryManager.standard
    var model = Observable<Array<UserModel>>()
    var queryModel = Observable<Array<String>>()
    
    // MARK: - Initialization
    
    init() {
        dataPersistenceManager.activeSearchContext = .users
        bindToPersistedData()
    }
    
    // MARK: - Bind to Persisted Data Method

    func bindToPersistedData() {
        dataPersistenceManager.bindUsers { [weak self] userHistory in
            if let userHistory = userHistory {
                self?.modelArray = userHistory.objects
                self?.queryModelArray = userHistory.queries
            }
        }
    }
    
}
