//
//  UserDataSource.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class UserTableViewDataSource: SKTableViewDataSource<UserTableCellViewModel> {
    
    override init() {
        super.init()
        cellClass = BasicTableViewCell.self
        cellConfigurator = UserTableViewCellConfigurator()
    }
    
}

class UserCollectionViewDataSource: SKCollectionViewDataSource<UserCollectionCellViewModel> {
    
    override init() {
        super.init()
        cellClass = BasicCollectionViewCell.self
        cellConfigurator = UserCollectionViewCellConfigurator()
    }
    
}
