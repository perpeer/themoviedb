//
//  PopulerMoviesController.swift
//  themoviedb
//
//  Created by Ekrem TAŞKIRAN on 10.05.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

class PopuperMoviesController: UICollectionViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.backgroundColor = .white
    
    setupNavigation()
  }
  
  fileprivate func setupNavigation() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "mode"), style: .done, target: self, action: #selector(handleDisplayModeBarButtonItem))
  }
  
  @objc fileprivate func handleDisplayModeBarButtonItem() {
    print("displayModeBarButton clicked...")
  }
  
  // default initializer
  init() {
    super.init(collectionViewLayout: UICollectionViewFlowLayout())
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
