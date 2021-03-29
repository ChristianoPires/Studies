//
//  ServicesController.swift
//  MyFavoritesTvShows
//
//  Created by christiano filipe pinto on 19/12/20.
//

import Foundation


class Service {
    
    static let shared = Service()
    
    var genres: [Genre] = []
    
    let apiKey = "e66c8e0c32f638c06855931b8fdd8187"
    
    let bearerToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNjZjOGUwYzMyZjYzOGMwNjg1NTkzMWI4ZmRkODE4NyIsInN1YiI6IjVmZGU2ZWMxNWIzNzBkMDA0MDQxOTVhMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TX7vm6WVX4DzPl6X7por36SVCuwpbP9iNuQQWUvqZYo"
    let contentType = "application/json"
    
}

extension Service {
    
    func getTvShows(callback: @escaping (([TVShow]) -> Void)) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            let urlConsome = "https://api.themoviedb.org/3/tv/popular?&language=pt-BR"
            print(urlConsome)
            guard let url = URL(string:urlConsome ) else {return}
            
            var request = URLRequest(url: url)
            request.addValue("Bearer \(self.bearerToken)", forHTTPHeaderField: "Authorization")
            request.addValue(self.contentType, forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let dataResponse = data, error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
                }
                do {
                    let data = try? JSONDecoder().decode(TVShowsResponse.self, from: dataResponse)
                    guard let d = data, let tvShows = d.tvShows else { return }
                    callback(tvShows)
                }
            }
            task.resume()
        }
        
    }
    
    
    func getTvShowGenres(callback: @escaping (() -> Void)) {
        DispatchQueue.global(qos: .userInitiated).async {
            let urlConsome = "https://api.themoviedb.org/3/genre/tv/list?&language=pt-BR"
            print(urlConsome)
            
            guard let url = URL(string:urlConsome ) else {return}
            
            var request = URLRequest(url: url)
            request.addValue("Bearer \(self.bearerToken)", forHTTPHeaderField: "Authorization")
            request.addValue(self.contentType, forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let dataResponse = data, error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
                }
                do {
                    let data = try? JSONDecoder().decode(GenresResponse.self, from: dataResponse)
                    guard let d = data, let genres = d.genres else { return }
                    Service.shared.genres = genres
                    callback()
                }
            }
            task.resume()
        }
    }
}
