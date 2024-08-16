//
//  RepositoryDataSource.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class RepositoryTableViewDataSource: SKTableViewDataSource<RepositoryTableCellViewModel> {
    
    override init() {
        super.init()
        cellClass = RepositoryTableViewCell.self
        cellConfigurator = RepositoryTableViewCellConfigurator()
    }
    
}

class RepositoryCollectionViewDataSource: SKCollectionViewDataSource<RepositoryCollectionCellViewModel> {
    
    override init() {
        super.init()
        cellClass = BasicCollectionViewCell.self
        cellConfigurator = RepositoryCollectionViewCellConfigurator()
    }
    
}
