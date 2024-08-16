//
//  DataPersistenceViewModel.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

protocol DataPersistenceViewModel: AnyObject {
    
    associatedtype LogicControllerType: DataPersistenceLogicController
    
    var logicController: LogicControllerType { get }
    
    init()

    func bindToModel()
    
}
