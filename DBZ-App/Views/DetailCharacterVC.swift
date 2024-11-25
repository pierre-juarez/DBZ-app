//
//  DetailCharacterVC.swift
//  DBZ-App
//
//  Created by Jhonatan Chavez on 25/11/24.
//

import UIKit

class DetailCharacterVC: UIViewController {
    
    
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    var characterDetail: CharacterDetail?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let character = characterDetail{
            setupActivityIndicator()
            imgCharacter.image = nil
            lblName.text = character.name
            lblDescription.text = character.description
            activityIndicator.startAnimating()
            
            ImageDownloader.shared.downloadImage(from: character.image) { [weak self] result in
                DispatchQueue.main.async {
                    guard let self = self else { return }
                    self.activityIndicator.stopAnimating()
                    
                    switch result{
                    case .success(let image):
                        self.imgCharacter.image = image
                    case .failure(let error):
                        print("Error al descargar img: ", error)
                        self.imgCharacter.image = UIImage(systemName: "person.crop.circle")
                    }
                }
            }
        }

    }
    
       
       private func setupActivityIndicator() {
           activityIndicator.translatesAutoresizingMaskIntoConstraints = false
           activityIndicator.transform = CGAffineTransform(scaleX: 1.5, y: 1.5) // Aumenta el tamaño
           imgCharacter.addSubview(activityIndicator) // Lo añades dentro de `imgCharacter` para centrarlo
           
           NSLayoutConstraint.activate([
               activityIndicator.centerXAnchor.constraint(equalTo: imgCharacter.centerXAnchor),
               activityIndicator.centerYAnchor.constraint(equalTo: imgCharacter.centerYAnchor)
           ])
           
           activityIndicator.hidesWhenStopped = true
       }


}
