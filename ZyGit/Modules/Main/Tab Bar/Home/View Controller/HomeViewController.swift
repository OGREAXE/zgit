//
//  HomeViewController.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class HomeViewController: UITableViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationBarConstants.configureAppearance(for: navigationController?.navigationBar)
    }

    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let section = indexPath.section
        let row = indexPath.row
        switch (section,row) {
        case (0,0): let userVC = UserViewController.instatiate(context: .main as UserContext)
                    navigationController?.pushViewController(userVC, animated: true)
        case (0,1): let repositoryVC = RepositoryViewController.instatiate(context: .main as RepositoryContext)
                    navigationController?.pushViewController(repositoryVC, animated: true)
        case (1,0):  let repositoryDetailVC = RepositoryDetailViewController.instatiate(parameter: "loay-ashraf/GitIt")
                     navigationController?.pushViewController(repositoryDetailVC, animated: true)
        default: break
        }
    }
    
    override public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let view = view as? UITableViewHeaderFooterView {
            view.textLabel?.textColor = UIColor(named: "AccentColor")
        }
    }
    
}
