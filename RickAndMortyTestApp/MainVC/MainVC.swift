//
//  ViewController.swift
//  RickAndMortyTestApp
//
//  Created by Otto Dzhandzhuliya on 18.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainVCView()
    var characters = [Result]()
    var firstPage = 1
    var isPageRefreshing: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        mainView.charactersCollectionView.delegate = self
        mainView.charactersCollectionView.dataSource = self
        NetWorkService.getCharacters(page: firstPage, completion: {characters in
            DispatchQueue.main.async {
                self.characters = characters
                self.mainView.charactersCollectionView.reloadData()
            }
        })
    }
}

extension MainViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainView.charactersCollectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.characterReuseId, for: indexPath) as! CharacterCell
        cell.characterName.text = self.characters[indexPath.row].name
        let imageUrlString = self.characters[indexPath.row].image
        let imageUrl:URL = URL(string: imageUrlString)!
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                  if let data = data, let image = UIImage(data: data) {
                      DispatchQueue.main.async {
                          cell.characterImage.image = image
                      }
                  }
              }.resume()
            cell.layer.cornerRadius = 15
        return cell
        
        }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CharacterVC(character: self.characters[indexPath.row], index: indexPath.row)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.mainView.charactersCollectionView.contentOffset.y >= self.mainView.charactersCollectionView.contentSize.height - self.mainView.charactersCollectionView.bounds.size.height {
            if !isPageRefreshing {
                isPageRefreshing = true
                firstPage = firstPage + 1
                NetWorkService.getCharacters(page:firstPage) { characters in
                    DispatchQueue.main.async {
                        self.characters.append(contentsOf: characters)
                        self.mainView.charactersCollectionView.reloadData()
                    }
                }
            } else {
              isPageRefreshing = false
              firstPage = firstPage + 1
                NetWorkService.getCharacters(page:firstPage) { characters in
                    DispatchQueue.main.async {
                        self.characters.append(contentsOf: characters)
                        self.mainView.charactersCollectionView.reloadData()
                    }
                }
            }
        }
         
        
        
    }
       
    
}
