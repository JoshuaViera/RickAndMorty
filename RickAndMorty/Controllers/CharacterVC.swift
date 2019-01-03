//
//  CharacterVC.swift
//  RickAndMorty
//
//  Created by Joshua Viera on 1/3/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var rickAndMortyCharacters = [RickAndMortyChar](){
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        RickAndMortyApiManager.manager.getCharacters { (error, characters) in
            if let characters = characters {
                DispatchQueue.main.async {
                    self.rickAndMortyCharacters = characters
                }
            } else if let error = error {
                print(error)
            }
        }
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rickAndMortyCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rickAndMortyCell", for: indexPath)
        cell.textLabel?.text = rickAndMortyCharacters[indexPath.row].name
        cell.detailTextLabel?.text = "ID: \(rickAndMortyCharacters[indexPath.row].id)"
        return cell
    }
}
