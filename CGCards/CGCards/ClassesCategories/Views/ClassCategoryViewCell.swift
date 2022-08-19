//
//  ClassCategoryViewCell.swift
//  CGCards
//
//  Created by Juan Andrey Valverde Malska on 17/08/22.
//

import Foundation
import UIKit
import Rswift

class ClassCategoryViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: ReuseIdentifier<ClassCategoryViewCell> = ReuseIdentifier(identifier: "classcategory-cell")
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.card_back()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with classCategory: ClassCategory) {
        nameLabel.text = classCategory.name
        if let cardImg = classCategory.cardImg {
            categoryImageView.loadImage(from: cardImg)
        }
    }
}

extension ClassCategoryViewCell {
    func configViews() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
    }
    
    func buildViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(categoryImageView)
    }
    
    func buildConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(22)
            make.centerX.equalToSuperview()
        }
        
        categoryImageView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
    }
}
