//
//  Poster.swift
//  lab-tunley
//
//  Created by Claudio Micieli on 2/10/23.
//

import Foundation

struct AlbumSearchResponse: Decodable {
    let results: [Album]
}

struct Album: Decodable {
    let backdrop_path : String
}

