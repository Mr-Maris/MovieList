//
//  Film.swift
//  MovieList
//
//  Created by Maris Rasnacs on 04/02/2021.
//

import Foundation

struct Film {
    let movie: String
    let genre: String
    let fullDetail: String
    
    static func createMovie() -> [Film] {
        var films: [Film] = []
        
        let movies = DataManager.shared.movie
        let genres = DataManager.shared.genre
        let fullDetails = DataManager.shared.fullDetail
        
        for index in 0..<movies.count {
            let film = Film(movie: movies[index], genre: genres[index], fullDetail: fullDetails[index])
            films.append(film)
        }
        return films
    }
}
