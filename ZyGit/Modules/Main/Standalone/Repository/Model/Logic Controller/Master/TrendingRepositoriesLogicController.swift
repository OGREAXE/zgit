//
//  TrendingRepositoriesLogicController.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

final class TrendingRepositoriesLogicController: RepositoryLogicController {
    
    // MARK: - Fetch Data Method
    
    override func fetchData() async -> Result<Array<RepositoryModel>,NetworkError> {
        await webServiceClient.fetchTrendingRepositories(page: modelList.currentPage)
    }
    
}
