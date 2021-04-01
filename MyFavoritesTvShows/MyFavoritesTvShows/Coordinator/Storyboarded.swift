//
//  Storyboarded.swift
//  MyFavoritesTvShows
//
//  Created by christiano filipe pinto on 31/03/21.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        return storyboard.instantiateViewController(identifier: id) as! Self
        
    }
    
}
