//
//  SearchHistorySwipeResponder.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class SearchHistoryTableViewSwipeResponder<T: SearchHistoryViewModel>: TableViewSwipeResponder {
    
    override func respondToSwipe(editingStyle: UITableViewCell.EditingStyle, atRow row: Int) {
        if let viewController = viewController as? SearchHistoryViewController<T>, editingStyle == .delete {
            viewController.deleteQuery(atRow: row)
        }
    }
    
}
