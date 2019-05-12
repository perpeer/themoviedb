//
//  MovieDetailsController.swift
//  themoviedb
//
//  Created by Ekrem TAŞKIRAN on 11.05.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

class MovieDetailsController: UIViewController {
  
  // MARK: - Local variables
  fileprivate let cellId = "cellId"
  var movieResult: MovieResult!
  
  // MARK: - Views
  let backdropImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleToFill
    iv.clipsToBounds = true
    return iv
  }()
  
  let headerLabel: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont.boldSystemFont(ofSize: 24)
    lbl.adjustsFontSizeToFitWidth = true
    return lbl
  }()
  
  let descriptionTextField: UITextView = {
    let tv = UITextView()
    tv.font = UIFont.systemFont(ofSize: 17)
    tv.isEditable = false
    tv.isSelectable = false
    return tv
  }()
  
  let voteCount: UILabel = {
    let lbl = UILabel()
    lbl.textColor = .white
    lbl.font = UIFont.boldSystemFont(ofSize: 20)
    lbl.textAlignment = .center
    lbl.backgroundColor = UIColor.rgb(red: 155, green: 89, blue: 182, alpha: 0.7)
    lbl.layer.cornerRadius = 5
    lbl.adjustsFontSizeToFitWidth = true
    lbl.minimumScaleFactor = 0.7
    lbl.clipsToBounds = true
    return lbl
  }()
  
  let voteAverage: UILabel = {
    let lbl = UILabel()
    lbl.textColor = .white
    lbl.font = UIFont.boldSystemFont(ofSize: 20)
    lbl.textAlignment = .center
    lbl.backgroundColor = UIColor.rgb(red: 229, green: 33, blue: 21, alpha: 0.7)
    lbl.layer.cornerRadius = 25
    lbl.clipsToBounds = true
    return lbl
  }()
  
  // MARK: — Override functions
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    // Change back button title
    navigationController?.navigationBar.topItem?.title = "Back"
    setupViews()
    
    let imageUrl = Service.getImageUrl(path: movieResult.backdrop ?? "")
    backdropImageView.sd_setImage(with: URL(string: imageUrl))
    headerLabel.text = "  " + movieResult.name
    voteCount.text = "\(movieResult.voteCount)"
    voteAverage.text = "\(movieResult.voteAverage)"
    descriptionTextField.text = movieResult.description
    navigationItem.title = movieResult.name
  }
  
  // MARK: - Add views to subview
  fileprivate func setupViews() {
    view.addSubview(backdropImageView)
    backdropImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 250)
    
    view.addSubview(voteCount)
    voteCount.anchor(top: backdropImageView.topAnchor, left: nil, bottom: nil, right: backdropImageView.rightAnchor, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 12, width: 100, height: 30)
    
    view.addSubview(voteAverage)
    voteAverage.anchor(top: nil, left: nil, bottom: backdropImageView.bottomAnchor, right: backdropImageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 12, paddingRight: 12, width: 50, height: 50)
    
    view.addSubview(headerLabel)
    headerLabel.anchor(top: backdropImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 40)
    
    view.addSubview(descriptionTextField)
    descriptionTextField.anchor(top: headerLabel.bottomAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
  }
}
