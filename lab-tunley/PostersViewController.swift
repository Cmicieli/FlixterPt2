//
//  PostersViewController.swift
//  lab-tunley
//
//  Created by Claudio Micieli on 2/10/23.
//

import UIKit
import Nuke

class PostersViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Get a collection view cell (based in the identifier you set in storyboard) and cast it to our custom AlbumCell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell

            // Use the indexPath.item to index into the albums array to get the corresponding album
            let album = albums[indexPath.item]

            // Get the artwork image url
        var x = "https://image.tmdb.org/t/p/original"
        x.append(album.backdrop_path)
        let imageUrl = URL(string: "\(x)")!

            // Set the image on the image view of the cell
            Nuke.loadImage(with: imageUrl, into: cell.posterImageView)

            return cell
    }
    
    var tracks: [Track] = []
    var albums: [Album] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        
        // Create a search URL for fetching albums (`entity=album`)
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=22c0c97c06ebf58b97d1adc8aebd3078")!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            // Create a JSON Decoder
            let decoder = JSONDecoder()
            do {
                // Try to parse the response into our custom model
                let response = try decoder.decode(AlbumSearchResponse.self, from: data)
                let albums = response.results
                
                DispatchQueue.main.async {
                    self?.albums = albums
                    self?.collectionView.reloadData()
                }
                
                print(albums)
            } catch {
                print(error.localizedDescription)
            }


        }

        // Initiate the network request
        task.resume()
        
        // Get a reference to the collection view's layout
        // We want to dynamically size the cells for the available space and desired number of columns.
        // NOTE: This collection view scrolls vertically, but collection views can alternatively scroll horizontally.
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumInteritemSpacing = 0

        // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumLineSpacing = 0

        // Set this to however many columns you want to show in the collection.
        let numberOfColumns: CGFloat = 3

        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns

        // Set the size that each tem/cell should display at
        layout.itemSize = CGSize(width: width, height: width)


    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Pt 1 - Pass the selected track to the detail view controller
        // Get the cell that triggered the segue
        if let cell = sender as? UICollectionViewCell,
           // Get the index path of the cell from the table view
           let indexPath = collectionView.indexPath(for: cell),
           // Get the detail view controller
           let posterViewController = segue.destination as? PosterViewController {
            
            // Use the index path to get the associated track
            let track = tracks[indexPath.row]
            
            // Set the track on the detail view controller
            posterViewController.track = track
        }
    }//end prepare

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
/*
 do {
     // Try to parse the JSON into a dictionary (aka: [String: Any])
     guard let jsonDictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
         print("❌ Could not cast data to dictionary")
         return
     }
     print(jsonDictionary)
 } catch {
     print("❌ Error parsing JSON: \(error.localizedDescription)")
 }
*/
