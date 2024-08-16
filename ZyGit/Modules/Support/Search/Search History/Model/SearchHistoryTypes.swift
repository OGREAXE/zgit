//
//  SearchHistoryTypes.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

struct SearchHistory<T: Model>: Codable {
    
    var objects: Array<T>
    var queries: Array<String>
    
    mutating func clear() {
        objects.removeAll()
        queries.removeAll()
    }
    
    init() {
        objects = Array<T>()
        queries = Array<String>()
    }
    
}
