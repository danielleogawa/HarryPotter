//
//  CharacterTableViewCell.swift
//  HarryPotter
//
//  Created by Danielle Nozaki Ogawa on 2024/06/30.
//

import UIKit

final class CharacterTableViewCell: UITableViewCell {
    
    static let identifier = "CharacterTableViewCell"
    
    lazy var thumbnailImage: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 40
        element.backgroundColor = .lightGray
        return element
    }()
    
    lazy var infoStack: UIStackView = {
        let element = UIStackView()
        element.distribution = .fillProportionally
        element.axis = .vertical
        element.spacing = 8
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        addSubview(thumbnailImage)
        
        addSubview(infoStack)
        infoStack.addArrangedSubview(createLabel(with: "name", fontWeight: .semibold))
        infoStack.addArrangedSubview(createLabel(with: "house"))
        infoStack.addArrangedSubview(createLabel(with: "wand"))
        
        NSLayoutConstraint.activate([
            thumbnailImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            thumbnailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            thumbnailImage.widthAnchor.constraint(equalToConstant: 80),
            thumbnailImage.heightAnchor.constraint(equalToConstant: 80),
            leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            topAnchor.constraint(equalTo: topAnchor, constant: 16),
            bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            infoStack.leadingAnchor.constraint(equalTo: thumbnailImage.trailingAnchor, constant: 8),
            infoStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            infoStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    private func createLabel(with text: String, fontWeight: UIFont.Weight = .regular) -> UILabel {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: fontWeight)
        label.text = text
        return label
    }
    
}
