//
//  SearchResultsViewModel.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

final class UserSearchResultsViewModel: SearchResultsViewModel {
    
    // MARK: - Properties
    
    typealias TableCellViewModelType = UserTableCellViewModel
    typealias LogicControllerType = UserSearchResultsLogicController
    
    var logicController = LogicControllerType()
    var cellViewModels = Observable<List<UserTableCellViewModel>>()
    
    // MARK: - Initialization
    
    init() {
        bindToModel()
    }
    
    // MARK: - Bind to Model Method
    
    func bindToModel() {
        logicController.bind { [weak self] modelList in
            if let modelList = modelList {
                let modelItems = modelList.items
                self?.cellViewModelList.items = modelItems.map { return UserTableCellViewModel(from: $0) }
                self?.cellViewModelList.currentPage = modelList.currentPage
                self?.cellViewModelList.isPaginable = modelList.isPaginable
            }
        }
    }
    
}

final class RepositorySearchResultsViewModel: SearchResultsViewModel {
   
    // MARK: - Properties
    
    typealias TableCellViewModelType = RepositoryTableCellViewModel
    typealias LogicControllerType = RepositorySearchResultsLogicController
    
    var logicController = LogicControllerType()
    var cellViewModels = Observable<List<RepositoryTableCellViewModel>>()
    
    // MARK: - Initialization
    
    init() {
        bindToModel()
    }
    
    // MARK: - Bind to Model Method
    
    func bindToModel() {
        logicController.bind { [weak self] modelList in
            if let modelList = modelList {
                let modelItems = modelList.items
                self?.cellViewModelList.items = modelItems.map { return RepositoryTableCellViewModel(from: $0) }
                self?.cellViewModelList.currentPage = modelList.currentPage
                self?.cellViewModelList.isPaginable = modelList.isPaginable
            }
        }
    }
    
}
