//
//  UIImageView+LoadImage.swift
//  GithubRepositories
//
//  Created by Juan Andrey Valverde Malska on 31/07/22.
//

import Foundation
import UIKit
import Nuke

extension UIImageView {
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        Nuke.loadImage(
            with: url,
            options: ImageLoadingOptions(placeholder: UIImage(systemName: "photo")),
            into: self
        )
    }
}
