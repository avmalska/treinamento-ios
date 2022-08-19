//
//  GenericSubCategoryTableViewCell.swift
//  CGCards
//
//  Created by Juan Andrey Valverde Malska on 09/08/22.
//

import Foundation
import UIKit
import Rswift

class GenericSubCategoryTableViewCell: UITableViewCell {
    
    static let reuseIentifier: ReuseIdentifier<GenericSubCategoryTableViewCell> = ReuseIdentifier(identifier: "subcategory-cell")
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with subCategory: GenericSubCategory) {
        nameLabel.text = subCategory.name
    }
    
}

extension GenericSubCategoryTableViewCell {
    func configViews() {
        backgroundColor = Colors.fundo()
    }
    
    func buildViews() {
        contentView.addSubview(nameLabel)
    }
    
    func buildConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
