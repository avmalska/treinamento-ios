//
//  CategoryItemView.swift
//  CGCards
//
//  Created by Juan Andrey Valverde Malska on 09/08/22.
//

import Foundation
import UIKit
import SnapKit

enum CategoryItemViewType {
    case sets
    case types
    case rarities
    case classes
    case spellSchools
    
    var title: String {
        switch self {
        case .sets:
            return Localizable.sets()
        case .types:
            return Localizable.types()
        case .rarities:
            return Localizable.rarities()
        case .classes:
            return Localizable.classes()
        case .spellSchools:
            return Localizable.spellSchools()
        }
    }
    
}

protocol CategoryItemViewDelegateProtocol {
    func touched(type: CategoryItemViewType)
}

class CategoryItemView: UIView {
    
    private let type: CategoryItemViewType
    
    var delegate: CategoryItemViewDelegateProtocol?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    init(type: CategoryItemViewType) {
        self.type = type
        
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func touched() {
        delegate?.touched(type: type)
    }
}

extension CategoryItemView {
    func configViews() {
        titleLabel.text = type.title
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touched)))
    }
    
    func buildViews() {
        addSubview(titleLabel)
    }
    
    func buildConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
