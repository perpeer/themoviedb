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
    let urlString = "\(Const.link)/movie/popular?language=en-US&api_key=\(Const.apiKey)&page=\(page)"
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
    let urlString = "\(Const.link)/search/movie?api_key=\(Const.apiKey)&query=\(searchTerm)&page=\(page)"
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

extension Service {
  // Send image url with path
  static func getImageUrl(path: String) -> String {
    return "https://image.tmdb.org/t/p/w400\(path)"
  }
}
