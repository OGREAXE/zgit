//
//  SearchHistoryViewControllerProtocol.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

protocol SearchHistoryDelegate: AnyObject {
    
    func reloadQuery(with query: String)
    func dismissHistoryKeyboard()
    
}
