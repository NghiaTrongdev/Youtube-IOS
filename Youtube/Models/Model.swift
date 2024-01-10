//
//  Model.swift
//  Youtube
//
//  Created by Trọng Nghĩa Nguyễn on 07/01/2024.
//

import Foundation

protocol ModelDelegate{
    func videosFetched (_ videos :[Video])
}

class Model {
    var delegate:ModelDelegate?
    
    func getVideo()
    {
        // Create URL object
        let url = URL(string:"https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=RDvPz8ftK_4bk&key=AIzaSyAOLNe4C8vn95wc8sGPTYbFDs0wGx89qRY")
        
        guard url != nil else {
            return
        }
        
    // Create URLSession object
        let session = URLSession.shared
        // Get a task data from
        let datatask = session.dataTask(with: url!){(data ,response, error) in
            if error != nil || data == nil {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil{
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched( response.items!)
                    }
                    
                }
                
//                dump(response)
            }catch{
                
            }
            
        }
        datatask.resume()
        // kick off task
    }
}
