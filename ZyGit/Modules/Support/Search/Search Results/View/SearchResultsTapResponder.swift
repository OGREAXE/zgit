//
//  SearchResultsTapResponder.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class SearchResultsTapResponder<T: SearchResultsViewModel>: TableViewTapResponder {
    
    override func respondToTap(atRow row: Int) {
        if let viewController = viewController as? SearchResultsViewController<T> {
            viewController.showDetail(atRow: row)
        }
    }
    
}
