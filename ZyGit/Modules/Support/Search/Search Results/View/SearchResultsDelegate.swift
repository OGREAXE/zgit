//
//  SearchResultsDelegate.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class SearchResultsTableViewDelegate<T: SearchResultsViewModel>: TableViewDelegate {
    
    init(_ viewController: UIViewController) {
        super.init()
        tapResponder = SearchResultsTapResponder<T>(viewController)
        contextMenuConfigurator = SearchResultsContextMenuConfigurator(viewController)
    }
    
}
