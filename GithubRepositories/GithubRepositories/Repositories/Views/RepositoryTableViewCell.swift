//
//  RepositoryTableViewCell.swift
//  GithubRepositories
//
//  Created by Juan Andrey Valverde Malska on 31/07/22.
//

import Foundation
import UIKit
import Rswift

class RepositoryTableViewCell: UITableViewCell {
    
    static let reuseIentifier: ReuseIdentifier<RepositoryTableViewCell> = ReuseIdentifier(identifier: "repository-cell")
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = Colors.discreto()
        return label
    }()
    
    lazy var ownerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 10, bottom: 10, trailing: 8)
        
        stackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touched)))
        return stackView
    }()
    
    @objc func touched() {
        print("???")
    }
    
    lazy var repositoryOwnerImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var ownerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    lazy var forksStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 5
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var forksLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var forksStarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .yellow
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
    
    func setup(with repository: Repository) {
        repositoryOwnerImageView.loadImage(from: repository.owner.pictureURL)
        descriptionLabel.text = repository.description
        nameLabel.text = repository.name
        ownerNameLabel.text = repository.owner.name
        forksLabel.text = String(repository.starCount)
        
    }
}

extension RepositoryTableViewCell {
    func configViews() {
        backgroundColor = .white
    }
    
    func buildViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(ownerStackView)
        contentView.addSubview(forksStackView)
        
        ownerStackView.addArrangedSubview(repositoryOwnerImageView)
        ownerStackView.addArrangedSubview(ownerNameLabel)
        
        forksStackView.addArrangedSubview(forksLabel)
        forksStackView.addArrangedSubview(forksStarImage)
    }
    
    func buildConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.top.equalToSuperview().offset(13)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(3)
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalTo(ownerStackView.snp.leading).inset(-30)
        }
        
        ownerStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(90)
        }
        
        repositoryOwnerImageView.snp.makeConstraints { make in
            make.size.equalTo(60)
        }
        
        forksStarImage.snp.makeConstraints { make in
            make.size.equalTo(16)
        }
        
        forksStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(17)
        }
    }
}
