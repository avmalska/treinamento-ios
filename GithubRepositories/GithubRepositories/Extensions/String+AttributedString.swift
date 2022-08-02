//
//  String+AttributedString.swift
//  GithubRepositories
//
//  Created by Juan Andrey Valverde Malska on 01/08/22.
//

import Foundation
import UIKit

extension String {
    func styledText(with text: String, and link: String, with linkFace: String) -> NSMutableAttributedString {
        let textStartAttributes: [NSMutableAttributedString.Key: Any] = [
            .foregroundColor: Colors.navbar()
        ]
        var textStart = NSMutableAttributedString(string: text, attributes: textStartAttributes)
        
        let textFinish = NSMutableAttributedString(string: link)
        
        textStart.append(textFinish)
        
        return textStart
    }
}
