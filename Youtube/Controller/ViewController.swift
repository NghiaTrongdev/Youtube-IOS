//
//  ViewController.swift
//  Youtube
//
//  Created by Trọng Nghĩa Nguyễn on 07/01/2024.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate,ModelDelegate{
    
    

   
    @IBOutlet weak var tableView: UITableView!
    
    var videos = [Video]()
    var model = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self 
        model.getVideo()
        

    }
    /// Model-delegate methods
    func videosFetched(_ videos: [Video]) {
        
        self.videos = videos
        
        
        tableView.reloadData()
    }
    
    
    /// Table View Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! ViewTableViewCell
        
        let video = self.videos[indexPath.row]
        
        
        cell.setCell(v:video)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
}

