//
//  SearchResponce.swift
//  Rick and Morty
//
//  Created by Olegio on 07.09.2022.
//

import Foundation

// Модель получения данных с сервера

struct SearchResponce: Codable {
    var results: [Person]
}

struct Person: Codable {
    var name: String
    var status: String
    var species: String
    var image: String
}
