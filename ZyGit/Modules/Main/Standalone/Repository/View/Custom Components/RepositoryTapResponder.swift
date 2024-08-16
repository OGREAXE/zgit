//
//  RepositoryDetailPresenter.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class RepositoryTableViewTapResponder: TableViewTapResponder {
    
    override func respondToTap(atRow row: Int) {
        if let viewController = viewController as? RepositoryViewController {
            viewController.showDetail(atRow: row)
        }
    }
    
}

class RepositoryCollectionViewTapResponder: CollectionViewTapResponder {
    
    override func respondToTap(atItem item: Int) {
        if let viewController = viewController as? RepositoryViewController {
            viewController.showDetail(atRow: item)
        }
    }
    
}
