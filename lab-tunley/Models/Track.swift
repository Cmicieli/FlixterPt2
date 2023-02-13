//
//  Track.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/2/22.
//

import Foundation

struct TracksResponse: Decodable {
    let total_results: Int
    let results: [Track]
}

// TODO: Pt 1 - Create a Track model struct
struct Track: Decodable{
    let original_title: String
    let overview: String
    let poster_path: String
    let vote_count: Int
    let vote_average: Double
    let popularity : Double
    let backdrop_path : String
}

extension Track {
/*
    /// An array of mock tracks
    static var mockTracks: [Track]  = [
        Track(movieTitle: "Puss in Boots: The Last Wish",
              movieDes: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
              posterUrl100: URL(string:"https://image.tmdb.org/t/p/w500///kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!,
              voteCount: "2983 Votes",
              voteAvg: "8.6 Vote Average",
              populatiry: "6178.562 Popularity",
              backDropUrl100: URL(string: "https://image.tmdb.org/t/p/w500///faXT8V80JRhnArTAeYXz0Eutpv9.jpg")!
             ),
        Track(movieTitle: "M3GAN",
              movieDes: "A brilliant toy company roboticist uses artificial intelligence to develop M3GAN, a life-like doll programmed to emotionally bond with her newly orphaned niece. But when the doll's programming works too well, she becomes overprotective of her new friend with terrifying results.",
              posterUrl100: URL(string:"https://image.tmdb.org/t/p/w500///d9nBoowhjiiYc4FBNtQkPY7c11H.jpg")!,
              voteCount: "1059 Votes",
              voteAvg: "7.6 Vote Average",
              populatiry: "4800.161 Popularity",
              backDropUrl100: URL(string: "https://image.tmdb.org/t/p/w500///otOtC45BDzFW7nuxnWHMmnYsicK.jpg")!
             ),
        Track(movieTitle: "Avatar: The Way of Water",
              movieDes: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.",
              posterUrl100: URL(string:"https://image.tmdb.org/t/p/w500///t6HIqrRAclMCA60NsSmeqe9RmNV.jpg")!,
              voteCount: "4859 Votes",
              voteAvg: "7.7 Vote Average",
              populatiry: "2463.327 Popularity",
              backDropUrl100: URL(string: "https://image.tmdb.org/t/p/w500///evaFLqtswezLosllRZtJNMiO1UR.jpg")!
             ),
        Track(movieTitle: "Devotion",
              movieDes: "The harrowing true story of two elite US Navy fighter pilots during the Korean War. Their heroic sacrifices would ultimately make them the Navy's most celebrated wingmen.",
              posterUrl100: URL(string:"https://image.tmdb.org/t/p/w500///26yQPXymbWeCLKwcmyL8dRjAzth.jpg")!,
              voteCount: "190 Votes",
              voteAvg: "7.6 Vote Average",
              populatiry: "1830.93 Popularity",
              backDropUrl100: URL(string: "https://image.tmdb.org/t/p/w500///5pMy5LF2JAleBNBtuzizfCMWM7k.jpg")!
             ),
        Track(movieTitle: "The Enforcer",
              movieDes: "A noir thriller set in Miami, the film follows an enforcer who discovers his femme fatale boss has branched out into cyber sex trafficking, putting a young runaway he’s befriended at risk. He sacrifices everything to save the young girl from the deadly organization he’s spent his life building.",
              posterUrl100: URL(string:"https://image.tmdb.org/t/p/w500///72V1r1G8S87ELagVxjqAUdChMCt.jpg")!,
              voteCount: "121 Votes",
              voteAvg: "7.4 Vote Average",
              populatiry: "1474.092 Popularity",
              backDropUrl100: URL(string: "https://image.tmdb.org/t/p/w500///Aqldsq65Nj1KAkQD2MzkZsAk5N5.jpg")!
             ),
            //Add from here
    ] */

    // We can now access this array of mock tracks anywhere like this:
    // let tracks = Tracks.mockTracks
}

// MARK: Helper Methods
/// Converts milliseconds to mm:ss format
///  ex:  208643 -> "3:28"
///  ex:
func formattedTrackDuration(with milliseconds: Int) -> String {
    let (minutes, seconds) = milliseconds.quotientAndRemainder(dividingBy: 60 * 1000)
    let truncatedSeconds = seconds / 1000
    if truncatedSeconds >= 10 {
        return "\(minutes):\(truncatedSeconds)"
    } else {
        return "\(minutes):0\(truncatedSeconds)"
    }
}
