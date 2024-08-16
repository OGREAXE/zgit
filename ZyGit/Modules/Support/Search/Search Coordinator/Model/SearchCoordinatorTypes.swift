//
//  SearchCoordinatorTypes.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

enum SearchContext {
    
    case users
    case repositories
    case organizations
    
}

enum SearchViewState {
    
    case idle
    case searching
    
}
