//
//  SearchResultsViewControllerProtocols.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

protocol SearchResultsDelegate: AnyObject {
    
    func addObject<T: TableCellViewModel>(with cellViewModel: T)
    func dismissResultsKeyboard()
    
}
