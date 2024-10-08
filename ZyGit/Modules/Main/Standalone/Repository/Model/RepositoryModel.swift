//
//  RepositoryModel.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import Foundation

struct RepositoryModel: Model {
    
    typealias CollectionCellViewModelType = RepositoryCollectionCellViewModel
    typealias TableCellViewModelType = RepositoryTableCellViewModel
    
    let id: Int
    let name: String
    let fullName: String
    let owner: OwnerModel
    let htmlURL: URL
    let description: String?
    let homepageURL: URL?
    let language: String?
    let stars: Int
    let forks: Int
    let defaultBranch: String
    var READMEString: String?
    var isComplete: Bool
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case name
        case fullName = "full_name"
        case owner
        case htmlURL = "html_url"
        case description
        case homepageURL = "homepage"
        case language
        case stars = "stargazers_count"
        case forks = "forks_count"
        case defaultBranch = "default_branch"
        
    }
    
    init() {
        id = 0
        name = ""
        fullName = ""
        owner = OwnerModel()
        htmlURL = URL(string: "www.github.com")!
        description = nil
        homepageURL = nil
        language = nil
        stars = 0
        forks = 0
        defaultBranch = ""
        isComplete = false
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        fullName = try values.decode(String.self, forKey: .fullName)
        owner = try values.decode(OwnerModel.self, forKey: .owner)
        htmlURL = try values.decode(URL.self, forKey: .htmlURL)
        description = try? values.decode(String.self, forKey: .description)
        homepageURL = try? values.decode(URL.self, forKey: .homepageURL)
        language = try? values.decode(String.self, forKey: .language)
        stars = try values.decode(Int.self, forKey: .stars)
        forks = try values.decode(Int.self, forKey: .forks)
        defaultBranch = try values.decode(String.self, forKey: .defaultBranch)
        READMEString = nil
        isComplete = false
    }
    
    init(from collectionCellViewModel: CollectionCellViewModelType) {
        self = collectionCellViewModel.model
    }
    
    init(from tableCellViewModel: TableCellViewModelType) {
        self = tableCellViewModel.model
    }
    
    init(from repository: RepositoryBookmark) {
        id = repository.id
        name = repository.name
        fullName = repository.fullName
        owner = OwnerModel(from: repository.owner!)
        htmlURL = URL(string: repository.htmlURL)!
        description = repository.overview
        homepageURL = URL(string: repository.homepageURL ?? "www.github.com")
        language = repository.language
        stars = repository.stars
        forks = repository.forks
        defaultBranch = repository.defaultBranch
        READMEString = repository.readmeString
        isComplete = true
    }
    
}
