//
//  HomeTabViewController.swift
//  GithubRepositories
//
//  Created by Juan Andrey Valverde Malska on 30/07/22.
//

import Foundation
import UIKit

class HomeTabBarViewController: UITabBarController {
    
    private var repositories: UIViewController {
        let navigation = UINavigationController()
        navigation.tabBarItem = .init(title: "Repositories", image: UIImage(systemName: "star"), tag: 0)
        
        let viewController = RepositoriesCoordinator.createModule(navigationController: navigation)
        
        navigation.viewControllers = [viewController]
        
        return navigation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [repositories]
    }
    
}
