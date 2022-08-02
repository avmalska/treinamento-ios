//
//  ProgrammingLanguagesStackView.swift
//  GithubRepositories
//
//  Created by Juan Andrey Valverde Malska on 01/08/22.
//

import Foundation
import UIKit
import SnapKit


protocol ProgrammingLanguagesStackViewDelegateProtocol {
    func touched(language: ProgrammingLanguage)
}


class ProgrammingLanguagesStackView: UIStackView {
    
    var selectedLanguage: ProgrammingLanguage
    
    var delegate: ProgrammingLanguagesStackViewDelegateProtocol?
    
    init(selectedLanguage: ProgrammingLanguage) {
        self.selectedLanguage = selectedLanguage
        
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
        
        update()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProgrammingLanguagesStackView {
    func configViews() {
        axis = .horizontal
        spacing = 18
    }
    
    func buildViews() {
        for language in ProgrammingLanguage.allCases {
            let languageView = ProgrammingLanguageItemView(programmingLanguage: language)
            languageView.delegate = self
            addArrangedSubview(languageView)
        }
    }
    
    func buildConstraints() {

    }
    
    func update() {
        for case let language as ProgrammingLanguageItemView in arrangedSubviews {
            language.isSelected = selectedLanguage == language.programmingLanguage
        }
    }
}

extension ProgrammingLanguagesStackView: ProgrammingLanguageItemViewDelegateProtocol{
    func touched(language: ProgrammingLanguage) {
        if selectedLanguage != language {
            selectedLanguage = language
            update()
            delegate?.touched(language: language)
        }
    }
    
}
