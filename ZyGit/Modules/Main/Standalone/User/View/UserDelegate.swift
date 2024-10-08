//
//  UserDelegate.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class UserTableViewDelegate: TableViewDelegate {
    
    init(_ viewController: UIViewController) {
        super.init()
        tapResponder = UserTableViewTapResponder(viewController)
        contextMenuConfigurator = UserTableViewContextMenuConfigurator(viewController)
    }
    
}

class UserCollectionViewDelegate: CollectionViewDelegate {
    
    init(_ viewController: UIViewController) {
        super.init()
        tapResponder = UserCollectionViewTapResponder(viewController)
        contextMenuConfigurator = UserCollectionViewContextMenuConfigurator(viewController)
    }
    
}
