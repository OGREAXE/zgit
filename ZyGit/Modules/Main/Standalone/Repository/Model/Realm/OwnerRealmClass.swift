//
//  OwnerRealmClass.swift
//  
//
// Created by Kevin on 16/08/2024
//
//

import Foundation
import RealmSwift

class OwnerBookmark: Object {
    
    // MARK: - Properties
    
    @Persisted var id: Int
    @Persisted var login: String
    @Persisted var avatarURL: String
    @Persisted var htmlURL: String
    @Persisted var type: String
    
    // MARK: - Initialization
    
    convenience init(from ownerModel: OwnerModel) {
        self.init()
        self.id = ownerModel.id
        self.login = ownerModel.login
        self.avatarURL = ownerModel.avatarURL.absoluteString
        self.htmlURL = ownerModel.htmlURL.absoluteString
        self.type = ownerModel.type.rawValue
    }
    
}
