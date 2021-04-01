//
//  Coordinator.swift
//  MyFavoritesTvShows
//
//  Created by christiano filipe pinto on 31/03/21.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var childCoordinators : [Coordinator] { get set }
    var navigationController : UINavigationController { get set}
    
    func start()
    
}
