//
//  InitialNC.swift
//  DBZ-App
//
//  Created by Jhonatan Chavez on 24/11/24.
//

import UIKit

class InitialNC: UINavigationController {
  
    
    private var viewModel = CharacterViewModel()
    private var characters: [CharacterDBZ] = []
    
    @IBOutlet weak var collectionCharacters: UICollectionView!
    
    static func loadFromNib() -> InitialNC{
        return InitialNC(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "APIx DBZ"
        
        let nib = UINib(nibName: "InitialCell", bundle: nil)
        collectionCharacters?.register(nib, forCellWithReuseIdentifier: "InitialCell")
        
        collectionCharacters?.delegate = self
        collectionCharacters?.dataSource = self
        
        //fetchData()

    }


    // MARK: getData
    private func fetchData(){
      
    }

}

extension InitialNC: UICollectionViewDataSource{
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

extension InitialNC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCharacter = characters[indexPath.row]
        print("Selected character: ", selectedCharacter)
    }
}
