//
//  SearchHistoryDelegate.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class SearchHistoryTableViewDelegate<T: SearchHistoryViewModel>: TableViewDelegate {
    
    init(_ viewController: UIViewController) {
        super.init()
        tapResponder = SearchHistoryTableViewTapResponder<T>(viewController)
    }
    
}

class SearchHistoryCollectionViewDelegate<T: SearchHistoryViewModel>: CollectionViewDelegate {
    
    init(_ viewController: UIViewController) {
        super.init()
        tapResponder = SearchHistoryCollectionViewTapResponder<T>(viewController)
        contextMenuConfigurator = SearchHistoryContextMenuConfigurator(viewController)
    }
    
}
