//
//  SeachHistoryCellConfigurator.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class SearchHistoryTableViewCellConfigurator: TableViewCellConfigurator {
    
    override func configure<T: TableCellViewModel>(_ cell: UITableViewCell, forDisplaying item: T) {
        if let cell = cell as? SearchHistoryTableViewCell, let item = item as? QueryCellViewModel {
            cell.historyLabel.text = item.query
            cell.setNeedsLayout()
        }
    }
    
}
