//
//  MainVC.swift
//  DBZ-App
//
//  Created by Jhonatan Chavez on 23/11/24.
//

import UIKit

class MainVC: UIViewController {
    
    
    private var viewModel = CharacterViewModel()
    private var characters: [CharacterDBZ] = []
    private var characterDetail = CharacterDetail()
    
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    
    
    @IBOutlet weak var collectionCharacters: UICollectionView!
    
    static func loadFromNib() -> MainVC{
        return MainVC(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "InitialCell", bundle: nil)
        collectionCharacters.register(nib, forCellWithReuseIdentifier: "InitialCell")
        
        collectionCharacters.delegate = self
        collectionCharacters.dataSource = self
        
        fetchData()
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: getData
    private func fetchData(){
        viewModel.getCharacters(page: 1, limit: 10) { result in
            switch result {
            case .success(let characters):
                self.characters = characters
                DispatchQueue.main.async{
                    self.collectionCharacters.reloadData()
                }
            case .failure(let error)
                : print("Error fetching characters: \(error)")
            }
        }
    }
    
    private func getDetailCharacter(characterID: Int){
        viewModel.getCharacterDetail(idCharacter: characterID) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let character):
                    self.characterDetail = character
                    let detailVC = DetailCharacterVC()
                    detailVC.characterDetail = self.characterDetail
                    self.navigationController?.pushViewController(detailVC, animated: true)
                case .failure(let error)
                    : print("Error fetching character with ID \(characterID): \(error)")
                }
            }
        }
    }
    
}


extension MainVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InitialCell", for: indexPath) as? InitialCell {
            let character = characters[indexPath.row]
            cell.configure(name: character.name, imgUrl: character.image)
            return cell
        } else {
            fatalError("Unable to dequeue InitialCell")
        }
        
    }
    
}

extension MainVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? InitialCell {
            cell.activityIndicator.color = .red
            cell.activityIndicator.startAnimating()
            let selectedCharacter = characters[indexPath.row]
            getDetailCharacter(characterID: selectedCharacter.id)
            cell.activityIndicator.color = .white
            cell.activityIndicator.stopAnimating()
        }

        
        
        
    }
}
