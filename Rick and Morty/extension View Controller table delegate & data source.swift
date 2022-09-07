//
//  extension View Controller table delegate & data source.swift
//  Rick and Morty
//
//  Created by Olegio on 07.09.2022.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CharacterTableViewCell
        
        cell.name.text = "123"
        cell.status.text = "456"
        cell.species.text = "789"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    } 
}
