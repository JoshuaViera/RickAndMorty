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
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
//        tableView.delegate = self
        loadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow, let detailVC = segue.destination as? EpisodeDetailVC else {
            fatalError("indexPath, detailVC nil")
        }
        let episode = episodes[indexPath.row]
        detailVC.episode = episode
        
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

extension EpisodesVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath)
        let episodeToSet = episodes[indexPath.row]
        cell.textLabel?.text = "\(episodeToSet.name)"
        cell.detailTextLabel?.text = "\(episodeToSet.episode)"
        return cell
    }
}
