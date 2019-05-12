//
//  PopularMovieFooterCell.swift
//  themoviedb
//
//  Created by Ekrem TAŞKIRAN on 11.05.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

class PopularMovieFooterCell: UICollectionViewCell {
  
  // MARK: — Views
  let loadMoreButton: UIButton = {
    let btn = UIButton(type: .system)
    btn.setTitle("Load More", for: .normal)
    btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    btn.backgroundColor = UIColor.rgb(red: 229, green: 33, blue: 21)
    btn.titleLabel?.textColor = .white
    btn.clipsToBounds = true
    btn.layer.cornerRadius = 10
    btn.tintColor = .white
    return btn
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(loadMoreButton)
    loadMoreButton.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
