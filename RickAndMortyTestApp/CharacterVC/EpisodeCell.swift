//
//  EpisodeCell.swift
//  RickAndMortyTestApp
//
//  Created by Otto Dzhandzhuliya on 19.08.2023.
//

import UIKit

class EpisodeCell: UITableViewCell {

    static let reuseId = "EpisodeCell"
    var bgView = UIView()
    let episodeName = UILabel(text: "", font: ODFonts.boldTextFont)
    let episodeSeries = UILabel(text: "", font: ODFonts.avenirLightSmall)
    let episodeDate = UILabel(text: "", font: ODFonts.avenirLightSmall)
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: EpisodeCell.reuseId)
        
        bgView.backgroundColor = UIColor(named: "cellBgColor")
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 16
        
        episodeSeries.textColor = .green
        episodeName.textColor = .white
        episodeDate.textColor = .lightGray
       
        Helper.tamicOff(views: [bgView,episodeName,episodeSeries,episodeDate])
        
        addSubview(bgView)
        bgView.addSubview(episodeName)
        bgView.addSubview(episodeSeries)
        bgView.addSubview(episodeDate)
        
        NSLayoutConstraint.activate([bgView.topAnchor.constraint(equalTo: topAnchor,constant: 6),
                                     bgView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 6),
                                     bgView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -6),
                                     bgView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -6)])
        
        NSLayoutConstraint.activate([episodeName.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 12),
                                     episodeName.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 12)])
        NSLayoutConstraint.activate([episodeSeries.topAnchor.constraint(equalTo: episodeName.bottomAnchor, constant: 12),
                                     episodeSeries.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 12)])
        NSLayoutConstraint.activate([episodeDate.topAnchor.constraint(equalTo: episodeName.bottomAnchor, constant: 8),
                                     episodeDate.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -12)])
                                     
                                     


    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
