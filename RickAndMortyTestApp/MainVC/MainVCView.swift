//
//  MainVCView.swift
//  RickAndMortyTestApp
//
//  Created by Otto Dzhandzhuliya on 18.08.2023.
//

import UIKit

class MainVCView: UIView {
    
    let charactersLabel = UILabel(text: "Characters", font: ODFonts.titleLabelFont)
    var charactersCollectionView:UICollectionView!

    init(){
        super.init(frame: CGRect())
        setupViews()
        setupConstraints()
    }
    
    func  setupViews() {
        
        backgroundColor = UIColor(named: "bgColor")
        
        charactersLabel.textColor = .white
        
        charactersCollectionView = UICollectionView(frame: CGRect(), collectionViewLayout: createCompositionalLayout())
        charactersCollectionView.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.characterReuseId)
        charactersCollectionView.backgroundColor = UIColor(named: "bgColor")

    }
    
    func setupConstraints() {
        
       Helper.tamicOff(views: [charactersLabel,charactersCollectionView])
        
        addSubview(charactersLabel)
        addSubview(charactersCollectionView)
        
        NSLayoutConstraint.activate([charactersLabel.topAnchor.constraint(equalTo: topAnchor,constant: 64),
                                     charactersLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24)])
        
        NSLayoutConstraint.activate([charactersCollectionView.topAnchor.constraint(equalTo: charactersLabel.bottomAnchor, constant: 24),
                                     charactersCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     charactersCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     charactersCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout(section: createSections())
        return layout
        
    }
    
    private func createSections() -> NSCollectionLayoutSection {
        //Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(0.9))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                               heightDimension: .fractionalWidth(0.7))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        //Section
        let spacing = CGFloat(8)
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 2
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 24, bottom: 0, trailing: -12)
        return section
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
