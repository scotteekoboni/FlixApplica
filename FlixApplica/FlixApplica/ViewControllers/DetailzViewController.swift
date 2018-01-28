//
//  DetailzViewController.swift
//  FlixApplica
//
//  Created by Scott Guidoboni on 1/26/18.
//  Copyright © 2018 doordontLLC. All rights reserved.
//

import UIKit

class DetailzViewController: UIViewController {

    @IBOutlet weak var backPicture: UIImageView!
    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    var movie: [String: Any]?
    var url: URL?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie {
            
        titleLabel.text = movie["title"] as? String
            releaseDateLabel.text = movie["release_date"] as? String
            overviewLabel.text = movie["overview"] as? String
            let backdropPathString = movie["backdrop_path"] as! String
            let posterPathString = movie["poster_path"] as! String
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            
            let backdropURL = URL(string: baseURLString + backdropPathString)!
            backDropImageView.af_setImage(withURL: backdropURL)
            
            let posterPathURL = URL(string: baseURLString + posterPathString)!
            backPicture.af_setImage(withURL: posterPathURL)
        }
        
        
        backPicture.af_setImage(withURL: url!)
        self.view.bringSubview(toFront: backPicture)
    
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
