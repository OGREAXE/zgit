//
//  CellViewModel.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

protocol CellViewModel: AnyObject {
    
    associatedtype ModelType
    
    var model: ModelType { get }
    
    init()
    init(from model: ModelType)
    
}

protocol CollectionCellViewModel: CellViewModel {
    
    associatedtype TableCellViewModelType: TableCellViewModel
    
    init(from tableCellViewModel: TableCellViewModelType)
    
    func tableCellViewModel() -> TableCellViewModelType
    func toggleBookmark()
    
}

protocol TableCellViewModel: CellViewModel {
    
    associatedtype CollectionCellViewModelType: CollectionCellViewModel
    
    init(from collectionCellViewModel: CollectionCellViewModelType)
    
    func collectionCellViewModel() -> CollectionCellViewModelType
    func toggleBookmark()
    
}

extension CellViewModel {
    
    // MARK: - Initialization
    
    init() {
        self.init()
    }
    
}

extension CollectionCellViewModel {
    
    // MARK: - View Actions
    
    func toggleBookmark() {
        fatalError("This Action cannot be performed on this cell type")
    }
    
}

extension TableCellViewModel {
    
    // MARK: - View Actions
    
    func toggleBookmark() {
        fatalError("This Action cannot be performed on this cell type")
    }
    
}
