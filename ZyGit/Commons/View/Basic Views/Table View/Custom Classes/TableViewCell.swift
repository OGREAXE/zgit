//
//  TableViewCell.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class TableViewCell: UITableViewCell {
 
    class var reuseIdentifier: String { return String(describing: TableViewCell.self) }
    class var nib: UINib? { return UINib(nibName: String(describing: TableViewCell.self), bundle: nil) }
    
}
