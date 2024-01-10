//
//  SaveCache.swift
//  Youtube
//
//  Created by Trọng Nghĩa Nguyễn on 10/01/2024.
//

import Foundation

class CacheManager {
    static var cache = [String:Data]()
    
    static func setCacheVideo(_ url: String , _ data:Data?){
        cache[url] = data

    }
    static func getCacheVideo(_ url : String) -> Data?{
        return cache[url]
    }
}
