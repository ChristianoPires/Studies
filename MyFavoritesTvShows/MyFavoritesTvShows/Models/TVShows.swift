//
//  TVShows.swift
//  MyFavoritesTvShows
//
//  Created by christiano filipe pinto on 19/12/20.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   var aPIResponse = try? newJSONDecoder().decode(APIResponse.self, from: jsonData)

// MARK: - APIResponse
struct TVShowsResponse: Decodable {
    let page: Int?
    let totalResults: Int?
    let totalPages: Int?
    let tvShows: [TVShow]?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case tvShows = "results"
    }
}

// MARK: - Result
struct TVShow: Decodable {
    var originalName: String?
    var genreIDS: [Int]?
    var name: String?
    var popularity: Double = 0
    var originCountry: [String]?
    var voteCount: Int = 0
    var firstAirDate: String?
    var backdropPath: String?
    var originalLanguage: String?
    var id: Int?
    var voteAverage: Double?
    var overview: String?
    var posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case originalName = "original_name"
        case genreIDS = "genre_ids"
        case name = "name"
        case popularity = "popularity"
        case originCountry = "origin_country"
        case voteCount = "vote_count"
        case firstAirDate = "first_air_date"
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case id = "id"
        case voteAverage = "vote_average"
        case overview = "overview"
        case posterPath = "poster_path"
    }
    
}

enum OriginCountry {
    case us
}

enum OriginalLanguage {
    case en
}

struct DataSource {
    static var dataSourceCode = [[String]]()
}
