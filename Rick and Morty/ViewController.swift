//
//  ViewController.swift
//  Rick and Morty
//
//  Created by Olegio on 07.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let cellId = "cell"
    let urlString = "https://rickandmortyapi.com/api/character/[1,2,3,4,5,6,7,8,9,10]"
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    // Установка и обновление таблицы
    private func setupTableView() {
        table.delegate = self
        table.dataSource = self
    }
}

