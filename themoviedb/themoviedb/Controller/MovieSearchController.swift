//
//  MovieSearchController.swift
//  themoviedb
//
//  Created by Ekrem TAŞKIRAN on 12.05.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

class MovieSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
  
  // MARK: - Local variables
  fileprivate let cellId = "cellId"
  fileprivate let footerId = "footerId"
  fileprivate let searchController = UISearchController(searchResultsController: nil)
  fileprivate var pageId = 1
  fileprivate var searchTerm = ""
  fileprivate var lastPage = 1

  var movieResult: [MovieResult] = [] {
    didSet {
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }
  
  // MARK: — Override functions
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.backgroundColor = .white
    collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(PopularMovieFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
    setupSearchBar()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    navigationController?.navigationBar.topItem?.title = "Search"
  }
  
  // MARK: — Data fetch
  fileprivate func searchMovies(searchTerm: String, page: Int) {
    Service.shared.searchMovie(searchTerm: searchTerm, page: page) { (res, err) in
      if let err = err {
        print("Search movies fetch failed...", err)
      }
      
      if let res = res {
        self.movieResult += res.results
        self.lastPage = res.lastPage
        self.pageId = res.page
      }
    }
  }
  
  // MARK: - Search
  fileprivate func setupSearchBar() {
    definesPresentationContext = true
    navigationItem.searchController = self.searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    searchController.dimsBackgroundDuringPresentation = false
    searchController.searchBar.delegate = self
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    let searchTextModify = searchText.replacingOccurrences(of: " ", with: "+")
    searchTerm = searchTextModify
    pageId = 1
    movieResult.removeAll()
    searchMovies(searchTerm: searchTextModify, page: pageId)
  }
  
  // MARK: - CollectionViewCell
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movieResult.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
    cell.nameLabel.text = movieResult[indexPath.item].name
    cell.voteAverageLabel.text = "Rating: \(movieResult[indexPath.item].voteAverage)"
    cell.dateLabel.text = "Date: \(movieResult[indexPath.item].date ?? "")"
    
    let imageUrl = getImageUrl(path: movieResult[indexPath.item].poster ?? "")
    cell.posterImage.sd_setImage(with: URL(string: imageUrl))
    
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let movieDetailsController = MovieDetailsController()
    movieDetailsController.movieResult = movieResult[indexPath.item]
    navigationController?.pushViewController(movieDetailsController, animated: true)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 200)
  }
  
  // MARK: - CollectionViewFooter
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath) as! PopularMovieFooterCell
    
    footer.loadMoreButton.addTarget(self, action: #selector(handleLoadMoreButtom), for: .touchUpInside)
    
    // Compare total page and check results array
    if pageId == lastPage || movieResult.isEmpty {
      footer.isHidden = true
      footer.isUserInteractionEnabled = false
    } else {
      footer.isHidden = false
      footer.isUserInteractionEnabled = true
    }
    return footer
  }
  
  @objc fileprivate func handleLoadMoreButtom() {
    // fetch next page
    searchMovies(searchTerm: searchTerm, page: pageId + 1)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.width, height: 65)
  }
  
  
  // MARK: - Default initializer
  init() {
    super.init(collectionViewLayout: UICollectionViewFlowLayout())
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
