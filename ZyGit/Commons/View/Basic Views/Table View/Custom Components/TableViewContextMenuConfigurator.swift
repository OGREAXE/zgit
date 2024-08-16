//
//  TableViewContextMenuConfigurator.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class TableViewContextMenuConfigurator {
    
    weak var viewController: UIViewController?
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func configure(atRow row: Int) -> UIContextMenuConfiguration? {
        return nil
    }
    
}
