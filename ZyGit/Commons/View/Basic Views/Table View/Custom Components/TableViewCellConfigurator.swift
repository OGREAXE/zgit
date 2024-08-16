//
//  TableViewCellConfigurator.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class TableViewCellConfigurator {
    
    func configure<T: TableCellViewModel>(_ cell: UITableViewCell, forDisplaying item: T) { /* override this method in sub classes */ }
    
}
