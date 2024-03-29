//
//  DetailViewController.swift
//  Youtube
//
//  Created by Trọng Nghĩa Nguyễn on 10/01/2024.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video :Video?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        // Check if there's a video
        guard  video != nil else{
            return
        }
        
        // Create the  embed  URL
        let urlString = Constants.Youtube_Embed + video!.videoId
        
        let url = URL(string: urlString)
        
        let urlRequest = URLRequest(url : url!)
        
        webView.load(urlRequest)
        
        // set the title
        titleLabel.text = video!.title
        // Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        // Set the Text view
        textView.text = video!.description
    }

}
