//
//  BaseTabBarController.swift
//  themoviedb
//
//  Created by Ekrem TAŞKIRAN on 10.05.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    viewControllers = [
      createNavController(viewController: PopuperMoviesController(), title: "Populer Movies", imageName: "movies"),
      createNavController(viewController: UIViewController(), title: "Search", imageName: "search")
    ]
  }
  
  fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
    let navController = UINavigationController(rootViewController: viewController)
    // viewcontroller settings
    viewController.navigationItem.title = title
    viewController.view.backgroundColor = .white
    // navcontroller settings
    navController.tabBarItem.title = title
    navController.tabBarItem.image = UIImage(named: imageName)
    navController.navigationBar.prefersLargeTitles = true
    return navController
  }
}
