//
//  UserTypes.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

enum UserContext: ViewControllerContext {
    
    case main
    case followers(userLogin: String,numberOfFollowers: Int)
    case following(userLogin: String,numberOfFollowing: Int)
    case stargazers(repositoryFullName: String,numberOfStargazers: Int)
    case contributors(repositoryFullName: String)
    case members(organizationLogin: String)
    
    var logicController: UserLogicController {
        switch self {
        case .main: return UserLogicController()
        case .followers(let userLogin, let numberOfFollowers): return FollowersLogicController(userLogin: userLogin, numberOfFollowers: numberOfFollowers)
        case .following(let userLogin, let numberOfFollowing): return FollowingLogicController(userLogin: userLogin, numberOfFollowing: numberOfFollowing)
        case .stargazers(let repositoryFullName, let numberOfStargazers): return StargazersLogicController(repositoryFullName: repositoryFullName, numberOfStargazers: numberOfStargazers)
        case .contributors(let repositoryFullName): return ContributorsLogicController(repositoryFullName: repositoryFullName)
        case .members(let organizationLogin): return MembersLogicController(organizationLogin: organizationLogin)
        }
    }
    
    var title: String {
        switch self {
        case .main: return TitleConstants.users.main
        case .followers: return TitleConstants.users.followers
        case .following: return TitleConstants.users.following
        case .stargazers: return TitleConstants.users.stargazers
        case .contributors: return TitleConstants.users.contributors
        case .members: return TitleConstants.users.members
        }
    }

}

protocol ViewControllerContext {
    
}
