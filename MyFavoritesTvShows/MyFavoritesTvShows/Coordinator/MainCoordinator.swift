//
//  MainCoordinator.swift
//  MyFavoritesTvShows
//
//  Created by christiano filipe pinto on 31/03/21.
//

import Foundation
import UIKit

class MainCoordinator : Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let vc = MainViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
        
    }
    
    func favorites(to favorites: [TVShow]) {
        
        let vc = FavoritesViewController.instantiate()
        vc.favoritesTvShows = favorites
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
        
    }
    
}
