//
//  SearchHistoryViewControllerExtensions.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

extension SearchHistoryViewController {
    
    // MARK: - Search Coordinator Outlet Methods
    
    func addObject<X: CollectionCellViewModel>(with cellViewModel: X) {
        viewModel.add(cellViewModel: cellViewModel as! T.ObjectCellViewModelType)
        updateCollectionView()
        layoutView()
    }
    
    func addQuery(with query: String) {
        viewModel.add(queryCellViewModel: QueryCellViewModel(from: query))
        updateTableView()
        layoutView()
    }
    
}
