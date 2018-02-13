//
//  NowPlayingViewController.swift
//  FlixApplica
//
//  Created by Scott Guidoboni on 1/17/18.
//  Copyright © 2018 doordontLLC. All rights reserved.
//

import UIKit
import AlamofireImage

class NowPlayingViewController: UIViewController, UITableViewDataSource {

    


    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    //var movies: [[String: Any]] = []
    var movies: [Movie] = []
    var refreshControl: UIRefreshControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector (NowPlayingViewController.didPullToRefresh(_:)), for: . valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        tableView.dataSource = self
        activityIndicator.startAnimating()
        fetchMovies()
        
        

    }
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        
        
        fetchMovies()
        
    }
    
    func fetchMovies() {
        
        MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
            }
        }
        
        func fetchDemPopMovies() {
            MovieApiManager().fetchPopMovies { (movies: [Movie]?, error: Error?) in
                if let movies = movies {
                    self.movies = movies
                    self.tableView.reloadData()
                }
            }
        }
        
        //movieapi.nowplaying
//        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
//        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
//        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//        let task = session.dataTask(with: request) { (data, response, error) in
//            //This will run when the network request returns
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data {
//                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
//                self.movies = []
//                for dictionary in movieDictionaries {
//                    let movie = Movie(dictionary: dictionary)
//                    self.movies.append(movie)
//                }
        
                
                
                //self.movies = movies
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
                self.activityIndicator.stopAnimating()
            
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return movies.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /////////////
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
            cell.movie = movies[indexPath.row]
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        //this was the reason the poster image wasnt appearing
        cell.posterImageView.af_setImage(withURL: movies[indexPath.row].posterUrl!)
        
        return cell
        
//
//        let movie = movies[indexPath.row]
//        //let title = movie["title"] as! String
//        let title = movie.title
//        //let overview = movie["overview"] as! String
//        let overview = movie.overview
//        cell.titleLabel.text = title
//        cell.overviewLabel.text = overview
//        //let posterPathString = movie["poster_path"] as! String
//        let postePathString = movie.posterPathString
//        //let baseURLString = "https://image.tmdb.org/t/p/w500"
//        let BaseURLString = movie.baseURLString
//
//        //let posterURL = URL(string: baseURLString + posterPathString)!
//        let posterURL = movie.posterUrl
//
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = 50
//        cell.posterImageView.af_setImage(withURL: posterURL!)
//
//
//        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! DetailzViewController
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        //let title = movie["title"] as! String
        //let overview = movie["overview"] as! String
        //cell.titleLabel.text = title
        //cell.overviewLabel.text = overview
        
        //let posterPathString = movie["poster_path"] as! String
        let posterPathString = movie.posterPathString
        //let baseURLString = "https://image.tmdb.org/t/p/w500"
        let baseURLString = movie.baseURLString
        
        tableView.deselectRow(at: indexPath, animated: true)
        //let posterURL = URL(string: baseURLString + posterPathString)!

        
        
        //cell.backPicture.af_setImage(withURL: posterURL)
        
        let url = URL(string: baseURLString + posterPathString)!
        vc.url = url
        vc.movie = movie

                
            }

    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}


