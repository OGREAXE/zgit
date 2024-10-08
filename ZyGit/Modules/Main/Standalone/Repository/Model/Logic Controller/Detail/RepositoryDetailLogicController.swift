//
//  RepositoryDetailLogicController.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

final class RepositoryDetailLogicController: WebServiceDetailLogicController {
    
    // MARK: - Properties
    
    typealias WebServiceClientType = GitHubClient
    typealias ModelType = RepositoryModel
    
    var webServiceClient = GitHubClient()
    var model = Observable<RepositoryModel>()
    var parameter = String()
    
    // MARK: - load Method
    
    func load() async -> NetworkError? {
        if !parameter.isEmpty, !modelObject.isComplete {
            let fetchError = processFetchResult(result: await fetchData())
            processREADMEFetchResult(result: await fetchREADME())
            return fetchError
        }
        return nil
    }
    
    // MARK: - Fetch Data Methods
    
    func fetchData() async -> Result<RepositoryModel,NetworkError> {
        await webServiceClient.fetchRepository(fullName: parameter)
    }
    
    func fetchREADME() async -> DataResult {
        await webServiceClient.downloadRepositoryREADME(fullName: modelObject.fullName, branch: modelObject.defaultBranch)
    }
    
    // MARK: - Fetch Result Processing Method
    
    func processREADMEFetchResult(result: DataResult) {
        switch result {
        case .success(let response): modelObject.READMEString = String(data: response, encoding: .utf8)
                                     modelObject.isComplete = true
        case .failure: modelObject.READMEString = nil
        }
    }
    
    // MARK: - (Un)Bookmark Methods
    
    @MainActor func bookmark() -> Bool {
        
        return false
    }
    
    @MainActor func unBookmark() -> Bool {
        
        return false
    }
    
    // MARK: - (Un)Star Methods
    
    func star() async -> Bool {
        return await webServiceClient.starRepository(fullName: modelObject.fullName) == nil ? true : false
    }
    
    func unStar() async -> Bool {
        return await webServiceClient.unStarRepository(fullName: modelObject.fullName) == nil ? true : false
    }
    
    // MARK: - Check For Status Methods
    
    func checkForStatus() async -> Array<Bool> {
        if NetworkManager.standard.isReachable, SessionManager.standard.sessionType == .authenticated {
            let isStarred = await checkIfStarred()
            let isBookmarked = await checkIfBookmarked()
            return [isBookmarked,isStarred]
        } else {
            let isBookmarked = await checkIfBookmarked()
            return [isBookmarked,false]
        }
    }

    func checkIfBookmarked() async -> Bool {
        return false
    }
    
    func checkIfStarred() async -> Bool {
        return await webServiceClient.checkIfStarredRepository(fullName: modelObject.fullName) == nil ? true : false
    }
    
}
