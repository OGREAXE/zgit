//
//  RepositoryDelegate.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class RepositoryTableViewDelegate: TableViewDelegate {
    
    init(_ viewController: UIViewController) {
        super.init()
        tapResponder = RepositoryTableViewTapResponder(viewController)
        contextMenuConfigurator = RepositoryTableViewContextMenuConfigurator(viewController)
    }
    
}

class RepositoryCollectionViewDelegate: CollectionViewDelegate {
    
    init(_ viewController: UIViewController) {
        super.init()
        tapResponder = RepositoryCollectionViewTapResponder(viewController)
        contextMenuConfigurator = RepositoryCollectionViewContextMenuConfigurator(viewController)
    }
    
}
