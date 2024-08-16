//
//  NavigationRouter.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class NavigationRouter {
    
    // MARK: - Properties
    
    static var currentNavigationController: UINavigationController?
    static var presentedViewController: UIViewController?
    
    // MARK: - Initialization
    
    private init() { }
    
    // MARK: - Navigation Presentation Methods
    
    class func push(viewController: UIViewController) {
        currentNavigationController = UIApplication.currentNavigationController()
        currentNavigationController?.pushViewController(viewController, animated: true)
    }
    
    class func pop() {
        if currentNavigationController == UIApplication.currentNavigationController() {
            currentNavigationController?.popViewController(animated: true)
        }
    }
    
    // MARK: - Modal Presentation Methods
    
    class func present(viewController: UIViewController) {
        let topViewController = UIApplication.currentViewController()
        presentedViewController = viewController
        topViewController?.present(viewController, animated: true, completion: nil)
    }
    
    class func dismiss() {
        presentedViewController?.dismiss(animated: true, completion: nil)
        presentedViewController = nil
    }
    
}
