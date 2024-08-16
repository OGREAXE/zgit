//
//  ModelProtocols.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

protocol Model: Codable, Equatable {
    
    associatedtype CollectionCellViewModelType: CollectionCellViewModel
    associatedtype TableCellViewModelType: TableCellViewModel
    
    var id: Int { get }
    var htmlURL: URL { get }
    var isComplete: Bool { get set }
    
    init()
    init(from collectionCellViewModel: CollectionCellViewModelType)
    init(from tableCellViewModel: TableCellViewModelType)
    
}
