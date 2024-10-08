//
//  RepositoryCellConfigurator.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class RepositoryTableViewCellConfigurator: TableViewCellConfigurator {
    
    var languageColors: [String:String]? = {
        let bundlePersistenceProvider = DataManager.standard.bundlePersistenceProvider
        if let languageColors = try? bundlePersistenceProvider.loadResource(title: "LanguageColors", withExtension: "json").get() {
            let dict = try? JSONSerialization.jsonObject(with: languageColors, options: [])
            return dict as? [String:String]
        }
        return nil
    }()
    
    override func configure<Type>(_ cell: UITableViewCell, forDisplaying item: Type) {
        if let cell = cell as? RepositoryTableViewCell, let item = item as? RepositoryTableCellViewModel {
            cell.ownerTextView.loadIcon(at: item.owner.avatarURL)
            cell.ownerTextView.text = item.owner.login
            cell.nameLabel.text = item.name
            if let description = item.description, !description.isEmpty {
                cell.descriptionLabel.text = item.description
            } else {
                cell.descriptionLabel.isHidden = true
            }
            cell.starsNumericView.numbers = [ Double(item.stargazers) ]
            cell.languageTextView.text = item.language
            if let language = item.language, let languageColors = languageColors {
                if let colorString = languageColors[language] {
                    let color = UIColor(hex: colorString)
                    cell.languageTextView.iconTintColor = color
                } else {
                    cell.languageTextView.text = nil
                }
            }
            cell.setNeedsLayout()
        }
    }
    
}

class RepositoryCollectionViewCellConfigurator: CollectionViewCellConfigurator {
    
    override func configure<Type>(_ cell: UICollectionViewCell, forDisplaying item: Type) {
        if let cell = cell as? BasicCollectionViewCell, let item = item as? RepositoryCollectionCellViewModel {
            cell.nameLabel.text = item.name
            cell.iconImageView.load(at: item.owner.avatarURL)
            cell.setNeedsLayout()
        }
    }
    
}
