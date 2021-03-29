//
//  ViewController.swift
//  MyFavoritesTvShows
//
//  Created by christiano filipe pinto on 19/12/20.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tvShows: [TVShow] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var listFavorites = false
    var favoritesTvShows: [TVShow] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            Service.shared.getTvShows { tvShows in
                Service.shared.getTvShowGenres {
                    self.tvShows = tvShows
                }
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFavorites" {
            let controller = segue.destination as! FavoritesViewController
            controller.favoritesTvShows = favoritesTvShows
        }
    }
    
    @IBAction func listFavorites(_ sender: Any) {
        
        performSegue(withIdentifier: "showFavorites", sender: self)
        
    }
}



extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  print("tableview tvshows count",self.tvShows.count)
        return self.tvShows.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 237
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.delegate = self
        cell.setup(tvShow: self.tvShows[indexPath.row])
        return cell
    }

}




extension MainViewController: TableViewCellDelegate {
    func doubleTapDetected(in cell: TableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            print("doubleTap \(indexPath) ")
            
            for favorite in self.favoritesTvShows {
                if favorite.id == self.tvShows[indexPath.row].id{
                    print("ja e favorito")
                    return
                }
            }
            self.favoritesTvShows.append(self.tvShows[indexPath.row])
        }
    }
    
}

