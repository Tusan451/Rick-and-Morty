//
//  DetailedViewController.swift
//  Rick and Morty
//
//  Created by Olegio on 07.09.2022.
//

import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var species: UILabel!
    
    var character = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // Конфигурация аутлетов
    private func configure() {
        name.text = character.name
        status.text = character.status
        species.text = character.species
        
        DispatchQueue.global().async {
            guard let characterImage = self.character.image else { return }
            guard let imageUrl = URL(string: characterImage) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.characterImage.image = UIImage(data: imageData)
            }
        }
    }
}
