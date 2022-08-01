//
//  GameCardView.swift
//  Memoria
//
//  Created by Juan Andrey Valverde Malska on 01/08/22.
//

import Foundation
import UIKit
import SnapKit

protocol GameCardViewDelegateProtocol {
    func touched(id: String)
}

class GameCardView: UIView {
    
    let id: String
    
    var delegate: GameCardViewDelegateProtocol?
    
    lazy var cardImageView: UIImageView = {
        let imagemView = UIImageView()
        imagemView.image = UIImage(named: "default")
        return imagemView
    }()
    
    init(id: String) {
        self.id = id
        
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameCardView {
    func configViews() {
        backgroundColor = .white
        layer.cornerRadius = 6
        layer.borderWidth = 1
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touched)))
    }
    
    @objc func touched() {
        print(id)
        delegate?.touched(id: id)
    }
    
    func buildViews() {
        addSubview(cardImageView)
    }
    
    func buildConstraints() {
        snp.makeConstraints { make in
            make.size.equalTo(110)
        }
        
        cardImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
