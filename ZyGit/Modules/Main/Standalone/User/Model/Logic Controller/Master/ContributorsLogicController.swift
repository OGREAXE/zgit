//
//  ContributorsLogicController.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

final class ContributorsLogicController: UserLogicController {
    
    // MARK: - Properties
    
    var repositoryFullName = String()
    
    // MARK: - Initialization
    
    init(repositoryFullName: String) {
        self.repositoryFullName = repositoryFullName
        super.init(maxItemCount: nil)
    }
    
    required init(maxItemCount: Int?, maxPageCount: Int = NetworkingConstants.maxPageCount) {
        super.init(maxItemCount: maxItemCount, maxPageCount: maxPageCount)
    }
    
    // MARK: - Fetch Data Method
    
    override func fetchData() async -> Result<Array<UserModel>,NetworkError> {
        await webServiceClient.fetchRepositoryContributors(fullName: repositoryFullName, page: modelList.currentPage)
    }
    
}
