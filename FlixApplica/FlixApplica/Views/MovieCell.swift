//
//  MovieCell.swift
//  FlixApplica
//
//  Created by Scott Guidoboni on 1/17/18.
//  Copyright © 2018 doordontLLC. All rights reserved.
//

import UIKit


class MovieCell: UITableViewCell {
    
    var movie: Movie! {
        didSet{
            //let movie = movies[indexPath.row]
            //let title = movie["title"] as! String
            let title = movie.title
            //let overview = movie["overview"] as! String
            let overview = movie.overview
            self.titleLabel.text = title //.self or nothing instead of cell.
            overviewLabel.text = overview
            //let posterPathString = movie["poster_path"] as! String
            let posterPathString = movie.posterPathString
            //let baseURLString = "https://image.tmdb.org/t/p/w500"
            let BaseURLString = movie.baseURLString
            
            //let posterURL = URL(string: baseURLString + posterPathString)!
            let posterURL = movie.posterUrl
            
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
