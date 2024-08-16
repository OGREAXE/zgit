//
//  NetworkProtocols.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

protocol WebServiceClient {
    
    var networkManager: NetworkManager { get }
    
    init()
    
}

extension WebServiceClient {
    
    // MARK: - Properties
    
    var networkManager: NetworkManager { return NetworkManager.standard }
    
    // MARK: - Initializer
    
    init() {
        self.init()
    }
    
}
