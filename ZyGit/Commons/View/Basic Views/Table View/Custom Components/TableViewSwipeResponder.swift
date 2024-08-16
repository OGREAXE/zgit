//
//  TableViewSwipeResponder.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class TableViewSwipeResponder {
    
    weak var viewController: UIViewController?
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func respondToSwipe(editingStyle: UITableViewCell.EditingStyle, atRow row: Int) { }
    
}

