//
//  PopularMovie.swift
//  themoviedb
//
//  Created by Ekrem TAŞKIRAN on 11.05.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

struct PopularMovieResult: Decodable {
  let page: Int
  let lastPage: Int
  let results: [MovieResult]
  
  enum CodingKeys: String, CodingKey {
    case page
    case lastPage = "total_pages"
    case results
  }
}

struct MovieResult: Decodable {
  let name: String
  let description: String
  let vote: Int
  let voteAverage: Double
  let poster: String
  let backdrop: String?
  
  enum CodingKeys: String, CodingKey {
    case name = "title"
    case description = "overview"
    case vote = "vote_count"
    case voteAverage = "vote_average"
    case poster = "poster_path"
    case backdrop = "backdrop_path"
  }
}
