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
        element.layer.masksToBounds = true
        element.contentMode = .scaleAspectFill
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
    
    lazy var nameLabel = createLabel(with: "name", fontWeight: .semibold)
    
    lazy var houseLabel = createLabel(with: "house")
    
    lazy var wandLabel = createLabel(with: "wand")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.nameLabel.text = nil
        self.houseLabel.text = nil
        self.wandLabel.text = nil
        self.thumbnailImage.image = nil
    }
    
    private func setUpView() {
        addSubview(thumbnailImage)
        
        addSubview(infoStack)
        if nameLabel.text != nil {
            infoStack.addArrangedSubview(nameLabel)
        }
        if houseLabel.text != nil {
            infoStack.addArrangedSubview(houseLabel)
        }
        if wandLabel.text != nil {
            infoStack.addArrangedSubview(wandLabel)
        }
        
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
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: fontWeight)
        label.text = text
        return label
    }
    
    func updateCell(name: String?, house: String?, wand: Wand?, thumbnailImage: String?) {
        self.nameLabel.text = name
        self.houseLabel.text = house
        self.wandLabel.text = wand?.core
        Task {
            self.thumbnailImage.image = try await Request.downloadImage(from: thumbnailImage)
        }
    }
}
