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
}
