//
//  InitialCell.swift
//  DBZ-App
//
//  Created by Jhonatan Chavez on 24/11/24.
//

import UIKit

class InitialCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupActivityIndicator()
    }
    
    
    func configure(name: String, imgUrl: String){
        lblName.text = name
        imgCharacter.image = nil
        activityIndicator.startAnimating()
        
        ImageDownloader.shared.downloadImage(from: imgUrl) { [weak self] result in
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
    
    private func setupActivityIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: imgCharacter.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: imgCharacter.centerYAnchor)
        ])
        
        activityIndicator.hidesWhenStopped = true
    }
    
    
}
