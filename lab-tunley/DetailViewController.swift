//
//  DetailViewController.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/5/22.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var voteAvgLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!

    // TODO: Pt 1 - Add a track property
    var track: Track!

    override func viewDidLoad() {
        super.viewDidLoad()

        var x = "https://image.tmdb.org/t/p/original"
        x.append(track.backdrop_path)

        Nuke.loadImage(with: URL(string: "\(x)")!, into: backdropImageView)

            // Set labels with the associated track values.
        titleLabel.text = track.original_title
            descriptionLabel.text = track.overview
            voteAvgLabel.text = String(track.vote_average)
            voteCountLabel.text = String(track.vote_count)
            popularityLabel.text = String(track.popularity)
    }



}
/*
 .append(track.poster_path)
 Nuke.loadImage(with: URL(string: "\(x)")!, into: posterImageView)
*/
