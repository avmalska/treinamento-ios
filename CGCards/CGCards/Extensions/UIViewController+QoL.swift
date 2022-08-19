//
//  UIViewController+QoL.swift
//  CGCards
//
//  Created by Juan Andrey Valverde Malska on 14/08/22.
//

import Foundation
import UIKit

protocol LoadingIndicatorViewType: AnyObject {
    var loadingIndicatorViewController: UIViewController? { get set }
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

extension LoadingIndicatorViewType where Self: UIViewController {
    
    func showLoadingIndicator() {
        let viewController = LoadingIndicatorViewController()
        loadingIndicatorViewController = viewController
        present(viewController, animated: true)
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.loadingIndicatorViewController?.dismiss(animated: true)
            self.loadingIndicatorViewController = nil
        }
    }
    
}
