//
//  ProgrammingLanguage.swift
//  GithubRepositories
//
//  Created by Juan Andrey Valverde Malska on 31/07/22.
//

import Foundation
import UIKit

enum ProgrammingLanguage: String, CaseIterable {
    case swift,
         kotlin,
         objc = "obj-c",
         java
    
    var image: UIImage? {
        switch self {
        case .swift:
            return Images.swift()
        case .kotlin:
            return Images.kotlin()
        case .objc:
            return Images.objc()
        case .java:
            return Images.java()
        }
    }
}
