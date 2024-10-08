//
//  UserLogicController.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

class UserLogicController: WebServicePlainLogicController {
    
    // MARK: - Properties
    
    typealias WebServiceClientType = GitHubClient
    typealias ModelType = UserModel
    
    var webServiceClient = GitHubClient()
    var model = Observable<List<UserModel>>()
    var maxItemCount: Int?
    var maxPageCount: Int
    
    // MARK: - Initialization
    
    required init(maxItemCount: Int?, maxPageCount: Int = NetworkingConstants.maxPageCount) {
        self.maxItemCount = maxItemCount
        self.maxPageCount = maxPageCount
        modelList.isPaginable = true
    }
    
    // MARK: - Fetch Data Method
    
    func fetchData() async -> Result<Array<UserModel>,NetworkError> {
        await webServiceClient.fetchUsers(page: modelList.currentPage)
    }
    
}
