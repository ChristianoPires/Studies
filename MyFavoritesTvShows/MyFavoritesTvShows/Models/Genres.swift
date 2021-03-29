//
//  Genres.swift
//  MyFavoritesTvShows
//
//  Created by christiano filipe pinto on 19/12/20.
//

import Foundation


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let genresResponse = try? newJSONDecoder().decode(GenresResponse.self, from: jsonData)

// MARK: - GenresResponse
struct GenresResponse: Decodable {
    let genres: [Genre]?
}

// MARK: - Genre
struct Genre: Decodable {
    let id: Int?
    let name: String?
}
