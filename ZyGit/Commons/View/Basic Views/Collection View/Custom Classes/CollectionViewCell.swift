//
//  CollectionViewCell.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
 
    class var reuseIdentifier: String { return String(describing: CollectionViewCell.self) }
    class var nib: UINib? { return UINib(nibName: String(describing: CollectionViewCell.self), bundle: nil) }
    
}
