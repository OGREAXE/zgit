//
//  SearchHistoryDataSource.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class SearchHistoryTableViewDataSource<T: SearchHistoryViewModel>: TableViewDataSource<QueryCellViewModel> {
    
    init(_ viewController: UIViewController) {
        super.init()
        cellClass = SearchHistoryTableViewCell.self
        cellConfigurator = SearchHistoryTableViewCellConfigurator()
        swipeResponder = SearchHistoryTableViewSwipeResponder<T>(viewController)
    }
    
}

class SearchHistoryCollectionViewDataSource<T: CollectionCellViewModel>: CollectionViewDataSource<T> {
    
    class func raw() -> CollectionViewDataSource<T> {
        switch T.self {
        case is UserCollectionCellViewModel.Type: return UserCollectionViewDataSource() as! CollectionViewDataSource<T>
        case is RepositoryCollectionCellViewModel.Type: return RepositoryCollectionViewDataSource() as! CollectionViewDataSource<T>
        
        default: return CollectionViewDataSource<T>()
        }
    }
    
}
