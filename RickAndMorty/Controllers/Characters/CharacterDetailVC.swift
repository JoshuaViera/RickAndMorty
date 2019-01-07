//
//  CharacterDetailVC.swift
//  RickAndMorty
//
//  Created by Joshua Viera on 1/3/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import UIKit

class CharacterDetailVC: UIViewController {


    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var species: UILabel!
    
    
    public var character: RickAndMortyChar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    func updateLabels() {
        title = character.name
        id.text = "ID: \(character.id)"
        species.text = "Species: \(character.species)"
    }
    @IBAction func dismissModul(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
