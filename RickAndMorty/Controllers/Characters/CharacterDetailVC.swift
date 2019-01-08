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
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var origin: UILabel!
    @IBOutlet weak var location: UILabel!
    public var character: RickAndMortyChar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    func updateLabels() {
        title = character.name
        name.text = "Name: \(character.name)"
        id.text = "ID: \(character.id)"
        species.text = "Species: \(character.species)"
        status.text = "Status: \(character.status)"
        origin.text = "Origin: \(character.origin.name)"
        
        location.text = """
        Currently Located: \(character.location.name)
        """
        ImageHelper.shared.fetchImage(urlString: character.image) { (image, error) in
            
            guard let image = image else {return}
            DispatchQueue.main.async {
                self.photo.image = image
            }
            
        }
        
    
    }
}
