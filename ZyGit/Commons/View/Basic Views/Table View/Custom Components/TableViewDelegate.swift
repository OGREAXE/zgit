//
//  TableViewDelegate.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class TableViewDelegate: NSObject, UITableViewDelegate {
    
    weak var tableView: TableView?
    var tapResponder: TableViewTapResponder?
    var contextMenuConfigurator: TableViewContextMenuConfigurator?
    var scrollViewAction: (() -> Void)?
    
    // MARK: - Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tapResponder?.respondToTap(atRow: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return contextMenuConfigurator?.configure(atRow: indexPath.row)
    }
    
    // MARK: - Scroll View Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollViewAction?()
    }
    
}
