//
//  ViewController.swift
//  Rick and Morty
//
//  Created by Olegio on 07.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let cellId = "cell"
    let urlString = "https://rickandmortyapi.com/api/character"
    let networkDataFetcher = NetworkDataFetcher()
    var searchResponce: SearchResponce? = nil
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    // Установка и обновление таблицы
    private func setupTableView() {
        table.delegate = self
        table.dataSource = self
        
        networkDataFetcher.fetchData(urlString: urlString) { searchResponce in
            guard let searchResponce = searchResponce else { return }
            self.searchResponce = searchResponce
            self.table.reloadData()
        }
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "moreInfo" else { return }
        guard let VC = segue.destination as? DetailedViewController else { return }
        
        if let indexPath = table.indexPathForSelectedRow {
            if let person = searchResponce?.results[indexPath.row] {
                VC.character = person
            }
        }
    }
}

