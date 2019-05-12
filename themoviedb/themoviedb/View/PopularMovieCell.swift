//
//  PopularMovieCell.swift
//  themoviedb
//
//  Created by Ekrem TAŞKIRAN on 11.05.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

class PopularMovieCell: UICollectionViewCell {
  
  // MARK: — Views
  let favoriteImage: UIImageView = {
    let iv = UIImageView()
    iv.backgroundColor = .red
    iv.isHidden = true
    return iv
  }()
  
  let posterImage: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleToFill
    iv.clipsToBounds = true
    return iv
  }()
  
  let nameLabel: UILabel = {
    let lbl = UILabel()
    lbl.backgroundColor = .black
    lbl.text = "Title"
    lbl.font = UIFont.boldSystemFont(ofSize: 18)
    lbl.textColor = .white
    lbl.isUserInteractionEnabled = false
    lbl.alpha = 0.7
    lbl.adjustsFontSizeToFitWidth = true
    lbl.minimumScaleFactor = 0.7
    return lbl
  }()
  
  // MARK: — Override functions
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  // MARK: - Add views to subview
  fileprivate func setupViews() {
    // Cell cornerradius
    layer.cornerRadius = 10
    clipsToBounds = true
    
    addSubview(posterImage)
    posterImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
    addSubview(favoriteImage)
    favoriteImage.anchor(top: posterImage.topAnchor, left: nil, bottom: nil, right: posterImage.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 50, height: 50)
    
    addSubview(nameLabel)
    nameLabel.anchor(top: nil, left: posterImage.leftAnchor, bottom: posterImage.bottomAnchor, right: posterImage.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 40)
  }
  
  // MARK: — Defaults
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
