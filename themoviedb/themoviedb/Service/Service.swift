//
//  Service.swift
//  themoviedb
//
//  Created by Ekrem TAŞKIRAN on 11.05.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

class Service {
  
  static let shared = Service()
  
  func fetchMovieDetail(page: Int, completion: @escaping (PopularMovieResult?, Error?) -> ()) {
    let urlString = "https://api.themoviedb.org/3/movie/popular?language=en-US&api_key=fd2b04342048fa2d5f728561866ad52a&page=\(page)"
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, resp, err) in
      if let err = err {
        print("fetchMovieDetail -> Failed to fetch...")
        completion(nil, err)
        return
      }
      
      guard let data = data else { return }
      
      do {
        let result = try JSONDecoder().decode(PopularMovieResult.self, from: data)
        completion(result, nil)
      } catch let jsonErr {
        print("fetchMovieDetail -> Failed to decode json: ", jsonErr)
        completion(nil, err)
      }
    }.resume()
  }
  
  func searchMovie(searchTerm: String, page: Int, completion: @escaping (PopularMovieResult?, Error?) -> ()) {
    let urlString = "https://api.themoviedb.org/3/search/movie?api_key=fd2b04342048fa2d5f728561866ad52a&query=\(searchTerm)&page=\(page)"
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, resp, err) in
      if let err = err {
        print("searchMovie -> Failed to fetch...")
        completion(nil, err)
        return
      }
      
      guard let data = data else { return }
      
      do {
        let result = try JSONDecoder().decode(PopularMovieResult.self, from: data)
        completion(result, nil)
      } catch let jsonErr {
        print("searchMovie -> Failed to decode json: ", jsonErr)
        completion(nil, err)
      }
      }.resume()
  }
}
