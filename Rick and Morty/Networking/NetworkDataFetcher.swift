//
//  NetworkDataFetcher.swift
//  Rick and Morty
//
//  Created by Olegio on 07.09.2022.
//

import Foundation

// Парсинг полученнных данных с сервера

class NetworkDataFetcher {
    
    let networkService = NetworkService()
    
    func fetchData(urlString: String, responce: @escaping (SearchResponce?) -> Void) {
        networkService.request(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let persons = try JSONDecoder().decode(SearchResponce.self, from: data)
                    responce(persons)
                } catch let jsonError {
                    print("Failed to decode json", jsonError)
                }
            case .failure(let error):
                print("Error recieved requesting data: \(error.localizedDescription)")
                responce(nil)
            }
        }
    }
}
