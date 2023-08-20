//
//  CharacterVC.swift
//  RickAndMortyTestApp
//
//  Created by Otto Dzhandzhuliya on 19.08.2023.
//

import UIKit

class CharacterVC: UIViewController {
    
    let characterView = CharacterVCView()
    
    var character: Result
    var index: Int = 0
    var episode = [Episode]()

    init(character:Result,index:Int) {
        self.character = character
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = characterView
        addTargets()
        getCharacterView()
        getEpisodes()
        self.characterView.table.delegate = self
        self.characterView.table.dataSource = self
    }
    
    func addTargets() {
        self.characterView.dismissButton.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
    }
 
    @objc func dismissSelf() {
        self.dismiss(animated: true)
    }
 
    func getEpisodes() {
                for item in self.character.episode {
                               NetWorkService.getEpisode(fetchUrl: item) { episodes in
                                   self.episode.append(episodes)
                }
            }
        }
 
    func getCharacterView() {
        characterView.characterName.text = character.name
        let imageUrl:URL = URL(string: character.image)!
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                  if let data = data, let image = UIImage(data: data) {
                      DispatchQueue.main.async {
                          self.characterView.characterImage.image = image
                      }
                  }
              }.resume()
        characterView.characterStatus.text = character.status
        characterView.characterSpecies.text = character.species
        characterView.characterGender.text = character.gender
        characterView.planet.text = character.location.name
    }
    
}

extension CharacterVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        character.episode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.characterView.table.dequeueReusableCell(withIdentifier: EpisodeCell.reuseId, for: indexPath) as! EpisodeCell
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = bgColorView
            self.episode.sort(by:  {$0.episode < $1.episode})
            cell.episodeName.text = self.episode[indexPath.row].name
            cell.episodeSeries.text = self.episode[indexPath.row].episode.replacingOccurrences(of: "E", with: " Episode: ").replacingOccurrences(of: "S", with: "Season: ")
            cell.episodeDate.text = self.episode[indexPath.row].air_date
        cell.backgroundColor = UIColor(named: "bgColor")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    
    
    
}
