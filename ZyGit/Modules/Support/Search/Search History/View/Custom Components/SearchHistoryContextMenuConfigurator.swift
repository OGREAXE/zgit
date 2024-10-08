//
//  SearchHistoryContextMenuConfigurator.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class SearchHistoryContextMenuConfigurator: CollectionViewContextMenuConfigurator {
    
    override func configure(atItem item: Int) -> UIContextMenuConfiguration? {
        if let viewController = viewController as? SearchHistoryViewController<UserSearchHistoryViewModel> {
            let actionProvider = SearchHistoryCollectionCellActionProvider(isBookmarked: viewController.viewModel.objectCellViewModelArray[item].isBookmarked,
                                                                           toggleBookmark: { viewController.toggleBookmark(atItem: item) },
                                                                           saveImage: { viewController.saveImage(atItem: item) },
                                                                           openInSafari: { viewController.openInSafari(atItem: item) },
                                                                           share: { viewController.share(atItem: item) },
                                                                           delete: { viewController.deleteObject(atItem: item) })
            return ContextMenuConfigurationConstants.SearchHistoryCollectionCellConfiguration(with: actionProvider)
        } else if let viewController = viewController as? SearchHistoryViewController<RepositorySearchHistoryViewModel> {
            let actionProvider = SearchHistoryCollectionCellActionProvider(isBookmarked: viewController.viewModel.objectCellViewModelArray[item].isBookmarked,
                                                                           toggleBookmark: { viewController.toggleBookmark(atItem: item) },
                                                                           saveImage: { viewController.saveImage(atItem: item) },
                                                                           openInSafari: { viewController.openInSafari(atItem: item) },
                                                                           share: { viewController.share(atItem: item) },
                                                                           delete: { viewController.deleteObject(atItem: item) })
            return ContextMenuConfigurationConstants.SearchHistoryCollectionCellConfiguration(with: actionProvider)
        }
        return nil
    }
    
}

struct SearchHistoryCollectionCellActionProvider {
    
    var isBookmarked: Bool
    var toggleBookmark: () -> Void
    var saveImage: () -> Void
    var openInSafari: () -> Void
    var share: () -> Void
    var delete: () -> Void
    
}
