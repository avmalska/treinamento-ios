//
//  HomeTabBarViewController.swift
//  CGCards
//
//  Created by Juan Andrey Valverde Malska on 02/08/22.
//

import Foundation
import UIKit

class HomeTabBarViewController: UITabBarController {

    private var categories: UIViewController {
        let navigation = UINavigationController()
        navigation.tabBarItem = .init(title: "Categorias", image: UIImage(systemName: "star"), tag: 0)
        
        let viewController = CategoriesCoordinator.createModule(navigationController: navigation)
        
        navigation.viewControllers = [viewController]
        
        return navigation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [categories]
    }
}