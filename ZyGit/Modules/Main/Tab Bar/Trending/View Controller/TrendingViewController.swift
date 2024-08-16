//
//  TrendingViewController.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class TrendingViewController: RepositoryViewController {

    // MARK: - Initialization
    
    required init?(coder: NSCoder, context: RepositoryContext) {
        fatalError("init(coder:context:) has not been implemented")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder, context: .trending)
    }
    
    // MARK: - View Helper Methods
    
    override func configureView() {
        super.configureView()
        NavigationBarConstants.configureAppearance(for: navigationController?.navigationBar)
    }

}
