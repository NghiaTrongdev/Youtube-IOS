//
//  Response.swift
//  Youtube
//
//  Created by Trọng Nghĩa Nguyễn on 08/01/2024.
//

import Foundation

struct Response: Decodable {
    var items : [Video]?
    
    enum CodingKeys : String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
        
    }
    
}
