//
//  CustomCardsItemView.swift
//  CGCards
//
//  Created by Juan Andrey Valverde Malska on 14/08/22.
//

import Foundation
import UIKit
import SnapKit

enum CustomCardsItemViewType {
    case viewCustomCards
    case createCustomCard
    
    var title: String {
        switch self {
        case .viewCustomCards:
            return Localizable.viewCustomCards()
        case . createCustomCard:
            return Localizable.createCstomCard()
        }
    }
    
    var imagem: UIImage? {
        switch self {
        case .viewCustomCards:
            return Images.panda()
        case . createCustomCard:
            return Images.keeper()
        }
    }
}

protocol CustomCardsItemViewDelegateProtocol {
    func touched(type: CustomCardsItemViewType)
}

class CustomCardsItemView: UIView {
    
    private let type: CustomCardsItemViewType
    
    var delegate: CustomCardsItemViewDelegateProtocol?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            .strokeColor : UIColor.black,
            .foregroundColor : UIColor.white,
            .strokeWidth : -0.9,
            .font : UIFont.boldSystemFont(ofSize: 40)
            ]
        
        label.attributedText = NSAttributedString(string: "Card", attributes: strokeTextAttributes)
        return label
    }()
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(frame: bounds)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.center = center
        return imageView
    }()
    
    init(type: CustomCardsItemViewType) {
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

extension CustomCardsItemView {
    func configViews() {
        titleLabel.text = type.title
        backgroundImageView.image = type.imagem
        backgroundColor = .cyan
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touched)))
    }
    
    func buildViews() {
        addSubview(backgroundImageView)
        addSubview(titleLabel)
    }
    
    func buildConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
}
