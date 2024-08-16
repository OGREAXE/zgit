//
//  SearchCoordinatorProtocols.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

protocol SearchModule: AnyObject {
    
    associatedtype SearchHistoryViewModelType: SearchHistoryViewModel
    associatedtype SearchResultsViewModelType: SearchResultsViewModel
    
    static var searchBarPlaceholder: String { get }
    
}

extension SearchModule {
    
    static var searchBarPlaceholder: String { return ViewConstants.SearchBar.general }
    
}
