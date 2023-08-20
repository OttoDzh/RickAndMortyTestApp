//
//  CharacterVCView.swift
//  RickAndMortyTestApp
//
//  Created by Otto Dzhandzhuliya on 19.08.2023.
//

import UIKit

class CharacterVCView: UIView {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let dismissButton = UIButton()
    let characterImage = UIImageView()
    let characterName = UILabel(text: "Name", font: ODFonts.titleLabelFont)
    let characterStatus = UILabel(text: "Alive", font: ODFonts.avenirRoman)
    let infoLabel = UILabel(text: "Info", font: ODFonts.titleLabelFont)
    let infoView = UIView()
    let characterSpeciesLabel = UILabel(text: "Species:", font: ODFonts.regulatTextFont)
    let characterSpecies = UILabel(text: "Human", font: ODFonts.regulatTextFont)
    let characterTypeLabel = UILabel(text: "Types:", font: ODFonts.regulatTextFont)
    let characterType = UILabel(text: "None", font: ODFonts.regulatTextFont)
    let characterGenderLabel = UILabel(text: "Gender:", font: ODFonts.regulatTextFont)
    let characterGender = UILabel(text: "None", font: ODFonts.regulatTextFont)
    let originLabel = UILabel(text: "Origin", font: ODFonts.titleLabelFont)
    let originView = UIView()
    let planetImage = UIImageView()
    let planet = UILabel(text: "Earth", font: ODFonts.titleLabelFont)
    let planetLabel = UILabel(text: "Planet", font: ODFonts.avenirRoman)
    let episodeLabel = UILabel(text: "Episodes", font: ODFonts.titleLabelFont)
    let table = UITableView()
    let forScrollLabel = UILabel(text: "", font: ODFonts.titleLabelFont)
    let planetImageView = UIView()
    var activityIndicator = UIActivityIndicatorView(style: .large)
    

    init(){
        super.init(frame: CGRect())
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        
        backgroundColor =  UIColor(named: "bgColor")
        
        dismissButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        dismissButton.tintColor = .white
        
        characterImage.image = UIImage(named: "launch")
        characterImage.clipsToBounds = true
        characterImage.layer.cornerRadius = 16
        
        characterName.textColor = .white
        
        characterStatus.textColor = .green
        
        infoLabel.textColor = .white
        
        infoView.backgroundColor = UIColor(named: "cellBgColor")
        infoView.clipsToBounds = true
        infoView.layer.cornerRadius = 16
        
        originView.backgroundColor = UIColor(named: "cellBgColor")
        originView.clipsToBounds = true
        originView.layer.cornerRadius = 16
        
        planetLabel.textColor = .green
        
        planetImage.image = UIImage(named: "planetImage")
        planetImage.clipsToBounds = true
        planetImage.layer.cornerRadius = 16
        
    
        table.separatorStyle = .none
        table.layer.cornerRadius = 15
        table.register(EpisodeCell.self, forCellReuseIdentifier: EpisodeCell.reuseId)
        table.backgroundColor = UIColor(named: "bgColor")
        
        planetImageView.backgroundColor = UIColor(named: "bgColor")
        planetImageView.clipsToBounds = true
        planetImageView.layer.cornerRadius = 10
        
        activityIndicator.color = .white
        
        
        
        let infoArray = [characterSpeciesLabel,characterSpecies,characterTypeLabel,characterType,characterGenderLabel,characterGender,originLabel,planet,episodeLabel,forScrollLabel]
        
        for items in infoArray {
            items.textColor = .white
        }
    }
    func setupConstraints() {
        
        Helper.tamicOff(views: [dismissButton,characterImage,characterName,characterStatus,infoLabel,infoView,characterSpeciesLabel,characterSpecies,characterTypeLabel,characterType,characterGenderLabel,characterGender,originLabel,originView,planet,planetImage,planetLabel,episodeLabel,table,scrollView,contentView,forScrollLabel,planetImageView,activityIndicator])
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(dismissButton)
        contentView.addSubview(characterImage)
        contentView.addSubview(characterName)
        contentView.addSubview(characterStatus)
        contentView.addSubview(infoLabel)
        contentView.addSubview(infoView)
        infoView.addSubview(characterSpeciesLabel)
        infoView.addSubview(characterSpecies)
        infoView.addSubview(characterType)
        infoView.addSubview(characterTypeLabel)
        infoView.addSubview(characterGender)
        infoView.addSubview(characterGenderLabel)
        contentView.addSubview(originLabel)
        contentView.addSubview(originView)
        originView.addSubview(planet)
        originView.addSubview(planetLabel)
        originView.addSubview(planetImageView)
        planetImageView.addSubview(planetImage)
        contentView.addSubview(episodeLabel)
        contentView.addSubview(table)
        contentView.addSubview(activityIndicator)
        contentView.addSubview(forScrollLabel)
        
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo:topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
        NSLayoutConstraint.activate([contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     contentView.widthAnchor.constraint(equalTo: widthAnchor)])
        
        NSLayoutConstraint.activate([dismissButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
                                     dismissButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
                                     dismissButton.widthAnchor.constraint(equalToConstant: 30),
                                     dismissButton.heightAnchor.constraint(equalToConstant: 30)])
        
        NSLayoutConstraint.activate([characterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 108),
                                     characterImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                                     characterImage.widthAnchor.constraint(equalToConstant: 148),
                                     characterImage.heightAnchor.constraint(equalToConstant: 148)])
        
        NSLayoutConstraint.activate([characterName.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 20),
                                     characterName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)])
        
        NSLayoutConstraint.activate([characterStatus.topAnchor.constraint(equalTo: characterName.bottomAnchor , constant: 10),
                                     characterStatus.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)])
        
        NSLayoutConstraint.activate([infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
                                     infoLabel.topAnchor.constraint(equalTo: characterStatus.bottomAnchor, constant: 20)])
        
        NSLayoutConstraint.activate([infoView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20),
                                     infoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
                                     infoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
                                     infoView.heightAnchor.constraint(equalToConstant: 124)])
        
        NSLayoutConstraint.activate([characterSpeciesLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 12),
                                     characterSpeciesLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 16)])
        NSLayoutConstraint.activate([characterSpecies.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -12),
                                     characterSpecies.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 16)])
        
        NSLayoutConstraint.activate([characterTypeLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 12),
                                     characterTypeLabel.topAnchor.constraint(equalTo: characterSpeciesLabel.bottomAnchor, constant: 16)])
        NSLayoutConstraint.activate([characterType.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -12),
                                     characterType.topAnchor.constraint(equalTo: characterSpecies.bottomAnchor, constant: 16)])
        
        NSLayoutConstraint.activate([characterGenderLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 12),
                                     characterGenderLabel.topAnchor.constraint(equalTo: characterTypeLabel.bottomAnchor, constant: 16)])
        NSLayoutConstraint.activate([characterGender.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -12),
                                     characterGender.topAnchor.constraint(equalTo: characterType.bottomAnchor, constant: 16)])
        
        NSLayoutConstraint.activate([originLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
                                     originLabel.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 20)])
        
        NSLayoutConstraint.activate([originView.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 20),
                                     originView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
                                     originView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
                                     originView.heightAnchor.constraint(equalToConstant: 80)])
        
        NSLayoutConstraint.activate([planetImageView.topAnchor.constraint(equalTo: originView.topAnchor, constant: 10),
                                     planetImageView.leadingAnchor.constraint(equalTo: originView.leadingAnchor, constant: 10),
                                     planetImageView.heightAnchor.constraint(equalToConstant: 64),
                                     planetImageView.widthAnchor.constraint(equalToConstant: 64)])
        
        NSLayoutConstraint.activate([planetImage.centerXAnchor.constraint(equalTo: planetImageView.centerXAnchor),
                                     planetImage.centerYAnchor.constraint(equalTo: planetImageView.centerYAnchor),
                                     planetImage.widthAnchor.constraint(equalToConstant: 24),
                                     planetImage.heightAnchor.constraint(equalToConstant: 24)])
        
        NSLayoutConstraint.activate([planet.leadingAnchor.constraint(equalTo: planetImageView.trailingAnchor, constant: 24),
                                     planet.trailingAnchor.constraint(equalTo: originView.trailingAnchor, constant: -6),
                                     planet.topAnchor.constraint(equalTo: originView.topAnchor, constant: 12)])
        
        NSLayoutConstraint.activate([planetLabel.leadingAnchor.constraint(equalTo: planetImageView.trailingAnchor, constant: 24),
                                     planetLabel.topAnchor.constraint(equalTo: planet.bottomAnchor, constant: 5)])
        
        
        NSLayoutConstraint.activate([episodeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
                                     episodeLabel.topAnchor.constraint(equalTo: originView.bottomAnchor, constant: 20)])
                                     
        NSLayoutConstraint.activate([table.topAnchor.constraint(equalTo: episodeLabel.bottomAnchor, constant: 20),
                                     table.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
                                     table.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19),
                                     table.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
        NSLayoutConstraint.activate([activityIndicator.topAnchor.constraint(equalTo: episodeLabel.bottomAnchor,constant: 48),
                                     activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)])
        
        NSLayoutConstraint.activate([forScrollLabel.topAnchor.constraint(equalTo: table.bottomAnchor, constant: 4),
                                     forScrollLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                                     forScrollLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                                     forScrollLabel.heightAnchor.constraint(equalToConstant: 200),
                                     forScrollLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
