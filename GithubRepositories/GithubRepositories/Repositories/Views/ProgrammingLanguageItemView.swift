//
//  ProgrammingLanguageItemView.swift
//  GithubRepositories
//
//  Created by Juan Andrey Valverde Malska on 31/07/22.
//

import Foundation
import UIKit
import SnapKit

protocol ProgrammingLanguageItemViewDelegateProtocol {
    func touched(language: ProgrammingLanguage)
}

class ProgrammingLanguageItemView: UIView {
    
    let programmingLanguage: ProgrammingLanguage
    var isSelected: Bool?
    
    var delegate: ProgrammingLanguageItemViewDelegateProtocol?
    
    lazy var languageNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var languageImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var languageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 13
        return stackView
    }()
    
    init(programmingLanguage: ProgrammingLanguage, isSelected: Bool = false) {
        self.programmingLanguage = programmingLanguage
        self.isSelected = isSelected
        
        super.init(frame: .zero)
                
        configViews()
        buildViews()
        buildConstraints()
        
        update()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProgrammingLanguageItemView {
    func configViews() {
        layer.borderWidth = 1
        layer.cornerRadius = 15
        languageNameLabel.text = programmingLanguage.rawValue
        languageImageView.image = programmingLanguage.image
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touched)))
    }
    
    func update() {
        if isSelected ?? false {
            layer.borderColor = UIColor.blue.cgColor
        } else {
            layer.borderColor = UIColor.black.cgColor
        }
    }
    
    @objc func touched() {
        delegate?.touched(language: programmingLanguage)
    }
    
    func buildViews() {
        addSubview(languageStackView)
        languageStackView.addArrangedSubview(languageImageView)
        languageStackView.addArrangedSubview(languageNameLabel)
    }
    
    func buildConstraints() {
        snp.makeConstraints { make in
            make.width.equalTo(100)
        }
        
        languageStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

