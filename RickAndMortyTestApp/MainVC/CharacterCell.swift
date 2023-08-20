//
//  CharacterCell.swift
//  RickAndMortyTestApp
//
//  Created by Otto Dzhandzhuliya on 18.08.2023.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    let backView = UIView()
    let characterImage = UIImageView()
    let characterName = UILabel(text: "Name", font: ODFonts.regulatTextFont)
    
    static let characterReuseId = "CharacterCell"
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        
        characterImage.image = UIImage(named: "launch")
        
        backView.backgroundColor = UIColor(named: "cellBgColor")
        backView.layer.cornerRadius = 15
        
        characterImage.layer.cornerRadius = 15
        characterImage.clipsToBounds = true
        
        characterName.textColor = .white
        characterName.textAlignment = .center
    }
    func setupConstraints() {
        
        Helper.tamicOff(views: [backView,characterImage,characterName])
        
        addSubview(backView)
        backView.addSubview(characterImage)
        backView.addSubview(characterName)
        
        NSLayoutConstraint.activate([backView.topAnchor.constraint(equalTo: topAnchor),
                                     backView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     backView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     backView.trailingAnchor.constraint(equalTo: trailingAnchor)])
        
        NSLayoutConstraint.activate([characterImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: 4),
                                     characterImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 4),
                                     characterImage.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -4),
                                     characterImage.heightAnchor.constraint(equalToConstant: 202)])
        
        NSLayoutConstraint.activate([characterName.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 8),
                                     characterName.leadingAnchor.constraint(equalTo: backView.leadingAnchor,constant: 4),
                                     characterName.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -4)])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
