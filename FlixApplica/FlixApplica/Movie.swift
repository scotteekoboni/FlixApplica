//
//  Movie.swift
//  FlixApplica
//
//  Created by Scott Guidoboni on 2/7/18.
//  Copyright © 2018 doordontLLC. All rights reserved.
//

import Foundation

class Movie {
    
    var title: String
    var overview: String
    var posterUrl: URL?
    var posterPathString: String
    var baseURLString: String
    var releaseDate: String
    
    init(dictionary: [String: Any]) {
        
         title = dictionary["title"] as? String ?? "No title"
        //let title = dictionary["title"] as! String
        overview = dictionary["overview"] as! String
        
        
         posterPathString = dictionary["poster_path"] as! String
        baseURLString = "https://image.tmdb.org/t/p/w500"
        
        posterUrl = URL(string: baseURLString + posterPathString)!
        releaseDate = dictionary["release_date"] as! String
        // Set the rest of the properties
    }

    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
    
    
    
    

}
