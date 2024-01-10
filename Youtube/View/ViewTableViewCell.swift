//
//  ViewTableViewCell.swift
//  Youtube
//
//  Created by Trọng Nghĩa Nguyễn on 10/01/2024.
//

import UIKit

class ViewTableViewCell: UITableViewCell {

    var video : Video?
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(v :Video){
        self.video = v
        
        guard self.video != nil else {
            return
        }
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        
        self.dateLabel.text = df.string(from :video!.published)
        
        
        guard self.video!.thumbnail != "" else {
            return
        }
        
        if let cacheData = CacheManager.getCacheVideo(self.video!.thumbnail){
            self.thumbnailImageView.image = UIImage(data: cacheData)
            return
        }
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let datatask = session.dataTask(with: url!){
            (data,response,error) in
            
            if data != nil && error == nil  {
                
                CacheManager.setCacheVideo(url!.absoluteString, data)
                
                if url?.absoluteString != self.video?.thumbnail {
                    return
                }
                
                
                
                let img = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = img
                }
                
                
                
            }
        }
        datatask.resume()
        
    }

}
