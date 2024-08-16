//
//  SearchResultsViewModelProtocols.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

protocol SearchResultsViewModel: WebServiceSearchTableViewModel {
    
    func toggleBookmark(atRow row: Int)
    
}

extension SearchResultsViewModel {
    
    // MARK: - View Actions
    
    func toggleBookmark(atRow row: Int) {
        items[row].toggleBookmark()
    }
    
}
