//
//  SettingsViewController.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit
import InAppSettingsKit

class SettingsViewController: IASKAppSettingsViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        navigationItem.title = Constants.View.Title.settings
    }
    
    // MARK: - View Actions
    
    func clearData(action: UIAlertAction) {
        try? DataManager.standard.clearData()
    }
    
    func signOut() {
        SessionManager.standard.signOut()
        try? DataManager.standard.clearAllData()
        performSegue(withIdentifier: "unwindToSplash", sender: self)
    }
    
    @IBAction func signOut(_ sender: UIButton) {
        AlertHelper.showAlert(alert: .signOut({ [weak self] in
            self?.signOut()
        }))
    }
    
}

extension SettingsViewController: IASKSettingsDelegate {
    
    // MARK: - IASKSettings Delegate
    
    func settingsViewControllerDidEnd(_ settingsViewController: IASKAppSettingsViewController) { }
    
    func settingsViewController(_ settingsViewController: IASKAppSettingsViewController, buttonTappedFor specifier: IASKSpecifier) {
        if specifier.key == "clButton" {
            let appURL = URL(string: UIApplication.openSettingsURLString)!
            if UIApplication.shared.canOpenURL(appURL) {
                UIApplication.shared.open(appURL)
            }
        } else if specifier.key == "tosButton" {
            URLHelper.openWebsite(URL(string: "https://docs.github.com/en/github/site-policy/github-terms-of-service")!)
        } else if specifier.key == "ppButton" {
            URLHelper.openWebsite(URL(string: "https://docs.github.com/en/github/site-policy/github-privacy-statement")!)
        } else if specifier.key == "clearButton" {
            AlertHelper.showAlert(alert: .clearData)
        }
    }
    
    // MARK: - Table View Data Source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.backgroundColor = UIColor(named: "Foreground Color")
        return cell
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return nil
    }
    
}
