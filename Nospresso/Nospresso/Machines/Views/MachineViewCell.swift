//
//  MachineViewCell.swift
//  Nospresso
//
//  Created by Treinamento on 29/07/22.
//

import Foundation
import UIKit
import Rswift

class MachineViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: ReuseIdentifier<MachineViewCell> = ReuseIdentifier(identifier: "machine-cell")
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansSemiBold(size: 20)
        label.textColor = Colors.textoCinza()
        return label
    }()
    
    lazy var machineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansSemiBold(size: 20)
        label.textColor = Colors.verdeClaro()
        return label
    }()
    
    lazy var addToFavoritesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
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
    
    func setup(with machine: Machine) {
        nameLabel.text = machine.name
        machineImageView.loadImage(from: machine.image)
        priceLabel.text = machine.price.asMoney
    }
    
}

extension MachineViewCell {
    
    func configViews() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
    }
    
    func buildViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(machineImageView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(addToFavoritesButton)
    }
    
    func buildConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        machineImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(146)
            make.width.equalTo(120)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        
        addToFavoritesButton.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().inset(10)
        }
    }
    
}
