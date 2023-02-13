//
//  ViewController.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/1/22.
//

import UIKit

class TracksViewController: UIViewController, UITableViewDataSource {
    
    // TODO: Pt 1 - Add a tracks property
    var tracks: [Track] = []

    override func viewDidLoad() {
        super.viewDidLoad()

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

            do {
                //let jsonDictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                //print(jsonDictionary)
                
                // Create a JSON Decoder
                let decoder = JSONDecoder()
                
                // Create a date formatter
                let dateFormatter = DateFormatter()

                // Set a custom date format based on what we see coming back in the JSON
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

                // Set the decoding strategy on the JSON decoder to use our custom date format
                decoder.dateDecodingStrategy = .formatted(dateFormatter)

                // Use the JSON decoder to try and map the data to our custom model.
                // TrackResponse.self is a reference to the type itself, tells the decoder what to map to.
                let response = try decoder.decode(TracksResponse.self, from: data)

                // Access the array of tracks from the `results` property
                let tracks = response.results
                
                // Execute UI updates on the main thread when calling from a background callback
                DispatchQueue.main.async {

                    // Set the view controller's tracks property as this is the one the table view references
                    self?.tracks = tracks

                    // Make the table view reload now that we have new data
                    self?.tableView.reloadData()
                }
                
                print("✅ \(tracks)")

            } catch {
                print("❌ Error parsing JSON: \(error)")
            }
        }


        // Initiate the network request
        task.resume()
        
        //tracks = Track.mockTracks
        print(tracks)
        
        tableView.dataSource = self
        
    }//end viewDidLoad
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }//end tableView
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as! TrackCell

        let track = tracks[indexPath.row]

        cell.configure(with: track)

        return cell
    }//end tableView

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Pt 1 - Pass the selected track to the detail view controller
        // Get the cell that triggered the segue
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = tableView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {
            
            // Use the index path to get the associated track
            let track = tracks[indexPath.row]
            
            // Set the track on the detail view controller
            detailViewController.track = track
        }
    }//end prepare

    // TODO: Pt 1 - Add table view data source methods
    
    // TODO: Pt 1 - Add table view outlet
    @IBOutlet weak var tableView: UITableView!
}//end
