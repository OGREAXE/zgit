//
//  SearchControllerProtocols.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

protocol SearchControllerDelegate: AnyObject {
    
    func didBeginSearchingSession()
    func didEndSearchingSession()
    func willSearch()
    func didSearch()
    
}
