//
//  CollectionViewDelegate.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class CollectionViewDelegate: NSObject, UICollectionViewDelegate {
    
    weak var collectionView: CollectionView?
    var tapResponder: CollectionViewTapResponder?
    var contextMenuConfigurator: CollectionViewContextMenuConfigurator?
    var scrollViewAction: (() -> Void)?
    
    // MARK: - Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        tapResponder?.respondToTap(atItem: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return contextMenuConfigurator?.configure(atItem: indexPath.item)
    }
    
    // MARK: - Scroll View Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollViewAction?()
    }

}
