//
//  TableViewCell.swift
//  MyFavoritesTvShows
//
//  Created by christiano filipe pinto on 20/12/20.
//

import Foundation
import UIKit

protocol TableViewCellDelegate: class {
    func doubleTapDetected(in cell: TableViewCell)
}


class TableViewCell : UITableViewCell, MultiTappable {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sinopseLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var avarageVoteLabel: UILabel!
    @IBOutlet weak var countVoteLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
   
    weak var multiTapDelegate: MultiTappableDelegate?
    lazy var tapCounter = ThreadSafeValue(value: 0)
    
    weak var delegate: TableViewCellDelegate?
    
    var tvShow : TVShow?
    var genres : [Genre]?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initMultiTap()
    }
    
    func setup(tvShow: TVShow) {
        self.isHidden = false
        self.tvShow = tvShow
        guard let tvShow = self.tvShow else { return }
        self.titleLabel.text = tvShow.name
        self.genreLabel.text = String()
        if let genreIDS = tvShow.genreIDS {
            for (index, tvShow) in genreIDS.enumerated() {
                self.genreLabel.text?.append(self.getGenre(id: tvShow))
                if index != genreIDS.count - 1 {
                    self.genreLabel.text?.append(", ")
                }
            }
        }
        sinopseLabel.text = tvShow.overview
        avarageVoteLabel.text = "\(tvShow.voteCount)"
        countVoteLabel.text = "\(tvShow.popularity)"
        if let posterPath = tvShow.posterPath {
            let path = "https://image.tmdb.org/t/p/w500/\(posterPath)"
            if let url = URL(string: path),
               let data = try? Data(contentsOf: url),
               let image: UIImage = UIImage(data: data) {
                posterImageView.image = image
            }
        }
    }
    
    func getGenre(id: Int) -> String {
        return Service.shared.genres.first(where: { $0.id == id})?.name ?? String()
    }
    
    
}


extension TableViewCell: MultiTappableDelegate {
    func singleTapDetected(in view: MultiTappable) {
        
    }
    
    func doubleTapDetected(in view: MultiTappable) { self.delegate?.doubleTapDetected(in: self)
    }
}
