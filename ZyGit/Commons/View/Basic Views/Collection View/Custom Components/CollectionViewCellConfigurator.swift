//
//  CollectionViewCellConfigurator.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class CollectionViewCellConfigurator {
    
    func configure<T: CollectionCellViewModel>(_ cell: UICollectionViewCell, forDisplaying item: T) { /* override this method in sub classes */ }
    
}
