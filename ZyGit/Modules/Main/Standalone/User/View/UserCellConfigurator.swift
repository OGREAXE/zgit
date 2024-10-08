//
//  UserCellConfigurator.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class UserTableViewCellConfigurator: TableViewCellConfigurator {
    
    override func configure<Type>(_ cell: UITableViewCell, forDisplaying item: Type) {
        if let cell = cell as? BasicTableViewCell, let item = item as? UserTableCellViewModel {
            cell.nameLabel.text = item.login
            cell.iconImageView.load(at: item.avatarURL)
            cell.setNeedsLayout()
        }
    }
    
}

class UserCollectionViewCellConfigurator: CollectionViewCellConfigurator {
    
    override func configure<Type>(_ cell: UICollectionViewCell, forDisplaying item: Type) {
        if let cell = cell as? BasicCollectionViewCell, let item = item as? UserCollectionCellViewModel {
            cell.nameLabel.text = item.login
            cell.iconImageView.load(at: item.avatarURL)
            cell.setNeedsLayout()
        }
    }
    
}
