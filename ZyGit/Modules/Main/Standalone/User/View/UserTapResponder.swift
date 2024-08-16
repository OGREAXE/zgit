//
//  UserTapResponder.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class UserTableViewTapResponder: TableViewTapResponder {
    
    override func respondToTap(atRow row: Int) {
        if let viewController = viewController as? UserViewController {
            viewController.showDetail(atRow: row)
        }
    }
    
}

class UserCollectionViewTapResponder: CollectionViewTapResponder {
    
    override func respondToTap(atItem item: Int) {
        if let viewController = viewController as? UserViewController {
            viewController.showDetail(atRow: item)
        }
    }
    
}
