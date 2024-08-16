//
//  CollectionViewTapResponder.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class CollectionViewTapResponder {

    weak var viewController: UIViewController?
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }

    func respondToTap(atItem item: Int) { }
    
}
