//
//  SearchResultsDataSource.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class SearchResultsTableViewDataSource<T: SearchResultsViewModel>: SKTableViewDataSource<T.TableCellViewModelType> {
    
    override init() {
        super.init()
        switch T.self {
        case is UserSearchResultsViewModel.Type: cellClass = BasicTableViewCell.self
                                                 cellConfigurator = UserTableViewCellConfigurator()
        case is RepositorySearchResultsViewModel.Type: cellClass = RepositoryTableViewCell.self
                                                       cellConfigurator = RepositoryTableViewCellConfigurator()
        
        default: break
        }
    }
    
}
