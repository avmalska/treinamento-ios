//
//  CardTableViewCell.swift
//  CGCards
//
//  Created by Juan Andrey Valverde Malska on 13/08/22.
//

import Foundation
import UIKit
import Rswift

class CardTableViewCell: UITableViewCell {
    
    static let reuseIentifier: ReuseIdentifier<CardTableViewCell> = ReuseIdentifier(identifier: "card-cell")
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            .strokeColor : UIColor.black,
            .foregroundColor : UIColor.white,
            .strokeWidth : -0.9,
            .font : UIFont.boldSystemFont(ofSize: 38)
            ]
        
        label.attributedText = NSAttributedString(string: "Card", attributes: strokeTextAttributes)
        return label
    }()
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(frame: bounds)
        imageView.image = Images.default_crop()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.center = center
        return imageView
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
    
    func setup(with card: Card) {
        if let cropImage = card.cropImage {
            if cropImage != "" {
                backgroundImageView.loadImage(from: cropImage)
            }
        }
        nameLabel.text = card.name
    }
    
}

extension CardTableViewCell {
    func configViews() {
        backgroundColor = Colors.fundo()
        
    }
    
    func buildViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(backgroundImageView)
        contentView.sendSubviewToBack(backgroundImageView)
        
    }
    
    func buildConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
}
