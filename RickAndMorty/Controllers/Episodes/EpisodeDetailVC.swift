//
//  EpisodeDetailVC.swift
//  RickAndMorty
//
//  Created by Joshua Viera on 1/3/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import UIKit

class EpisodeDetailVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var SeasonNEpisode: UILabel!
    @IBOutlet weak var airDate: UILabel!
    @IBOutlet weak var id: UILabel!
    
    public var episode: RickAndMortyEp!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
    }
    
    func setUpLabels() {
        name.text = "Episode:\(episode.name)"
        SeasonNEpisode.text = "Season/Episode: \(episode.episode)"
        airDate.text = "AirDate: \(episode.air_date)"
        id.text = "Episode ID: \(episode.id)"
    }
    
    
}
