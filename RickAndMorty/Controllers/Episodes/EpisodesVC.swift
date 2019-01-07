//
//  EpisodesVC.swift
//  RickAndMorty
//
//  Created by Joshua Viera on 1/6/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import UIKit

class EpisodesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var episodes = [RickAndMortyEp](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


    func loadData() {
        RickAndMortyApiManager.manager.getEpisodes{ (error, episode) in
            if let error = error {
                print(error.localizedDescription)
            } else if let episode = episode {
                self.episodes = episode
            }
        }
    }
}

extension EpisodesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
extension EpisodesVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(episodes.count)
        return episodes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as? EpisodeCell else {fatalError("yer")}
//                cell.photo.image =
        
        let episodeToSet = episodes[indexPath.row]
        cell.name.text = episodeToSet.name
        cell.episode.text = episodeToSet.episode
        cell.air_date.text = episodeToSet.air_date
        return cell
    }
}
