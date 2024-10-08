//
//  SearchCoordinatorExtensions.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

extension SearchCoordinator {
    
    // MARK: - View Helper Methods
    
    func render(_ state: SearchViewState) {
        switch state {
        case .searching: showResults()
                         resetNavigationController()
        case .idle: hideResults()
                    resetNavigationController()
        }
    }
    
    func resetNavigationController() {
        navigationController.popToRootViewController(animated: false)
    }
    
    func resetControllers() {
        searchHistoryController.reset()
        searchResultsController.reset()
    }
    
    func showResults() {
        UIView.transition(with: searchHistoryController.view, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.searchHistoryController.addChild(self.searchResultsController)
            self.searchHistoryController.view.addSubview(self.searchResultsController.view)
            self.searchResultsController.didMove(toParent: self.searchHistoryController!)
            self.searchResultsController.view.frame = self.searchHistoryController.view.frame
        }, completion: nil)
    }
    
    func hideResults() {
        UIView.transition(with: searchHistoryController.view, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.searchResultsController.willMove(toParent: nil)
            self.searchResultsController.removeFromParent()
            self.searchResultsController.view.removeFromSuperview()
        }, completion: nil)
    }
    
}

extension SearchCoordinator: SearchControllerDelegate {
    
    // MARK: - Search Controller Delegate Methods
    
    func didBeginSearchingSession() {
        render(.idle)
    }
    
    func didEndSearchingSession() {
        query = ""
        render(.idle)
        resetControllers()
    }
    
    func willSearch() {
        render(.searching)
        searchHistoryController.addQuery(with: query)
        searchResultsController.search(with: query)
    }
    
    func didSearch() {
        render(.idle)
        resetControllers()
    }
    
}

extension SearchCoordinator: SearchHistoryDelegate {
    
    // MARK: - History Delegate Methods
    
    func reloadQuery(with query: String) {
        self.query = query
        render(.searching)
        searchResultsController.search(with: query)
    }
    
    func dismissHistoryKeyboard() {
        searchController.searchBar.searchTextField.resignFirstResponder()
    }
    
}

extension SearchCoordinator: SearchResultsDelegate {
    
    // MARK: - Results Delegate Methods
    
    func addObject<T: TableCellViewModel>(with cellViewModel: T) {
        let collectionCellViewModel = cellViewModel.collectionCellViewModel()
        searchHistoryController.addObject(with: collectionCellViewModel)
    }
    
    func dismissResultsKeyboard() {
        searchController.searchBar.searchTextField.resignFirstResponder()
    }
    
}
