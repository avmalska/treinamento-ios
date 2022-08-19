//
//  CategoryItemView.swift
//  CGCards
//
//  Created by Juan Andrey Valverde Malska on 09/08/22.
//

import Foundation
import UIKit
import SnapKit

enum CategoryItemViewType: String {
    case sets = "set"
    case types = "type"
    case rarities = "rarity"
    case classes = "class"
    case spellSchools = "spellSchool"
    
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
    
    var slug: String {
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
    
    var imagem: UIImage? {
        switch self {
        case .sets:
            return Images.hearthstone_adventure()
        case .types:
            return Images.hearhstone_cards()
        case .rarities:
            return Images.hearthstone_raritiy()
        case .classes:
            return Images.hearhstone_class()
        case .spellSchools:
            return Images.hearhstone_spells()
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
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        imageView.image = type.imagem
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touched)))
    }
    
    func buildViews() {
        addSubview(titleLabel)
        addSubview(imageView)
    }
    
    func buildConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.size.equalTo(123)
        }
    }
}
