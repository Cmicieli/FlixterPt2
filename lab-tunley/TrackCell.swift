//
//  TrackCell.swift
//  lab-tunley
//
//  Created by Claudio Micieli on 1/28/23.
//

import UIKit
import Nuke

class TrackCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Configures the cell's UI for the given track.
    func configure(with track: Track) {
        titleLabel.text = track.original_title
        descriptionLabel.text = track.overview

        var y = "https://image.tmdb.org/t/p/original"
        y.append(track.poster_path)
        Nuke.loadImage(with: URL(string: "\(y)")!, into: posterImageView)
        
    }

    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    

}
/*
 // Load image async via Nuke library image loading helper method
 do
 {
     Nuke.loadImage(with: x.append(track.poster_path) as! ImageRequestConvertible, into: posterImageView)
 }
 catch
 {
     print("\(error)")
 }
*/
