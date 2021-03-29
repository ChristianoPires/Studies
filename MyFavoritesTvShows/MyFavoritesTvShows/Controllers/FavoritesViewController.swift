//
//  FavoritesViewController.swift
//  MyFavoritesTvShows
//
//  Created by christiano filipe pinto on 22/12/20.
//

import UIKit

class FavoritesViewController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var favoritesTvShows: [TVShow] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func backToMainScreen(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}


extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("tableview tvshows count",self.favoritesTvShows.count)
        return self.favoritesTvShows.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 237
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.setup(tvShow: self.favoritesTvShows[indexPath.row])
        return cell
    }

}
