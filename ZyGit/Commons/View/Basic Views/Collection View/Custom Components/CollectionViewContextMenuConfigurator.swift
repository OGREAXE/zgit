//
//  CollectionViewContextMenuConfigurator.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class CollectionViewContextMenuConfigurator {
    
    weak var viewController: UIViewController?
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func configure(atItem item: Int) -> UIContextMenuConfiguration? {
        return nil
    }
    
}
