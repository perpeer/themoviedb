//
//  Extensions.swift
//  themoviedb
//
//  Created by Ekrem TAŞKIRAN on 11.05.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

func getImageUrl(path: String) -> String {
  return "https://image.tmdb.org/t/p/w400\(path)"
}

extension UIColor {
  static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
  }
}

extension UIView {
  func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
      topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
    }
    
    if let left = left {
      leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
    }
    
    if let right = right {
      rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
    }
    
    if let bottom = bottom  {
      bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
    }
    
    if width != 0 {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    if height != 0 {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
  }
}
