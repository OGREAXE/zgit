//
//  MembersLogicController.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

final class MembersLogicController: UserLogicController {
    
    // MARK: - Properties
    
    var organizationLogin = String()
    
    // MARK: - Initialization
    
    init(organizationLogin: String) {
        self.organizationLogin = organizationLogin
        super.init(maxItemCount: nil)
    }
    
    required init(maxItemCount: Int?, maxPageCount: Int = NetworkingConstants.maxPageCount) {
        super.init(maxItemCount: maxItemCount, maxPageCount: maxPageCount)
    }
    
    // MARK: - Fetch Data Method
    
    override func fetchData() async -> Result<Array<UserModel>,NetworkError> {
        await webServiceClient.fetchOrganizationMemebers(organizationLogin: organizationLogin, page: modelList.currentPage)
    }
    
}
