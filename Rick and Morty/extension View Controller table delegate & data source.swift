//
//  extension View Controller table delegate & data source.swift
//  Rick and Morty
//
//  Created by Olegio on 07.09.2022.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var personsCount = 0
        if let searchResponce = searchResponce {
            personsCount = searchResponce.results.count
        }
        return personsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CharacterTableViewCell
        
        if let person = searchResponce?.results[indexPath.row] {
            cell.configure(for: person)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    } 
}
