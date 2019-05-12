//
//  PopularMoviesController.swift
//  themoviedb
//
//  Created by Ekrem TAŞKIRAN on 10.05.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit
import SDWebImage

class PopuperMovieController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

  // MARK: - Local variables
  fileprivate let cellId = "cellId"
  fileprivate let footerId = "footerId"
  fileprivate var isMultiColumn = false
  fileprivate var pageId = 1
  
  var movieResult: [MovieResult] = [] {
    didSet {
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.backgroundColor = .white
    collectionView.register(PopularMovieCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(PopularMovieFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
    
    setupNavigation()
    fetchMovies(page: pageId)
  }
  
  fileprivate func fetchMovies(page: Int) {
    Service.shared.fetchMovieDetail(page: page) { (res, err) in
      if let err = err {
        print("Popular movies fetch failed...", err)
      }
      
      if let res = res {
        self.movieResult += res.results
        self.pageId = res.page
      }
    }
  }
  
  fileprivate func setupNavigation() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "mode"), style: .done, target: self, action: #selector(handleDisplayModeBarButtonItem))
  }
  
  @objc fileprivate func handleDisplayModeBarButtonItem() {
    // switch display mode
    isMultiColumn = isMultiColumn ? false : true
    collectionView.reloadData()
  }

  // MARK: - UICollectionViewCell
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movieResult.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PopularMovieCell
    cell.nameLabel.text = "  " + movieResult[indexPath.item].name
    
    var imageUrl = getImageUrl(path: movieResult[indexPath.item].backdrop ?? "")
    
    // switch display mode
    if isMultiColumn {
      imageUrl = getImageUrl(path: movieResult[indexPath.item].poster)
      cell.clipsToBounds = true
      cell.layer.cornerRadius = 10
    }
    cell.posterImage.sd_setImage(with: URL(string: imageUrl))
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let movieDetailsController = MovieDetailsController()
    movieDetailsController.movieResult = movieResult[indexPath.item]
    navigationController?.pushViewController(movieDetailsController, animated: true)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    var width = view.frame.width - 8
    var height: CGFloat = 200
    
    // switch display mode
    if isMultiColumn {
      width = (view.frame.width / 2) - 8
      height = height * 1.33
    }
    return CGSize(width: width, height: height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 10, left: 4, bottom: 0, right: 4)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 8
  }
  
  // MARK: - Footer
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath) as! PopularMovieFooterCell
    
    footer.loadMoreButton.addTarget(self, action: #selector(handleLoadMoreButtom), for: .touchUpInside)
    return footer
  }
  
  @objc fileprivate func handleLoadMoreButtom() {
    // fetch next page
    fetchMovies(page: pageId + 1)
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
