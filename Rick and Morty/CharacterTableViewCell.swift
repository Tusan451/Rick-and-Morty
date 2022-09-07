//
//  CharacterTableViewCell.swift
//  Rick and Morty
//
//  Created by Olegio on 07.09.2022.
//

import UIKit

// Модель кастомной ячейки

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var species: UILabel!
    
    // Конфигурация элементов ячейки
    func configure(for person: Person) {
        
        name.text = person.name
        status.text = person.status
        species.text = person.species
        
        DispatchQueue.global().async {
            guard let personImage = person.image else { return }
            guard let imageUrl = URL(string: personImage) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.characterImage.image = UIImage(data: imageData)
            }
        }
    }
}
