//
//  CharacterVC.swift
//  RickAndMorty
//
//  Created by Joshua Viera on 1/3/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import UIKit

class CharacterVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var allCharacters = [RickAndMortyChar](){
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
                    self.allCharacters = characters
                }
            } else if let error = error {
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow, let detailVC = segue.destination as? CharacterDetailVC else {
            fatalError("indexPath, detailVC nil")
        }
        let character = allCharacters[indexPath.row]
        detailVC.character = character
        
    }
}

extension CharacterVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)
        let characterToSet = allCharacters[indexPath.row]
        
        ImageHelper.shared.fetchImage(urlString: characterToSet.image) { (image, error) in
            
            guard let image = image else {return}
            DispatchQueue.main.async {
                cell.imageView?.image = image
                cell.setNeedsLayout()
            }
            
        }
        
        cell.textLabel?.text = "\(characterToSet.name)"
        return cell
    }
}
