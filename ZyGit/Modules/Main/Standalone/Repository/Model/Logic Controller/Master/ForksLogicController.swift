//
//  ForksLogicController.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

final class ForksLogicController: RepositoryLogicController {
    
    // MARK: - Properties
    
    var repositoryFullName = String()
    
    // MARK: - Initialization
    
    init(repositoryFullName: String, numberOfForks: Int) {
        self.repositoryFullName = repositoryFullName
        super.init(maxItemCount: numberOfForks)
    }
    
    required init(maxItemCount: Int?, maxPageCount: Int = NetworkingConstants.maxPageCount) {
        super.init(maxItemCount: maxItemCount, maxPageCount: maxPageCount)
    }
    
    // MARK: - Fetch Data Method
    
    override func fetchData() async -> Result<Array<RepositoryModel>,NetworkError> {
        await webServiceClient.fetchRepositoryForks(fullName: repositoryFullName, page: modelList.currentPage)
    }
    
}
