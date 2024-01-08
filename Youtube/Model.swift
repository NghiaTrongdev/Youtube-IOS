//
//  Model.swift
//  Youtube
//
//  Created by Trọng Nghĩa Nguyễn on 07/01/2024.
//

import Foundation


class Model {
    func getVideo()
    {
        // Create URL object
        let url = URL(string:Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
    // Create URLSession object
        let session = URLSession.shared
        // Get a task data from
        let datatask = session.dataTask(with: url!){
            (data ,response, error) in
            if error != nil || data == nil {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            }catch{
                
            }
            
        }
        datatask.resume()
        // kick off task
    }
}
