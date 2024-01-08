//
//  Constants.swift
//  Youtube
//
//  Created by Trọng Nghĩa Nguyễn on 07/01/2024.
//

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyAOLNe4C8vn95wc8sGPTYbFDs0wGx89qRY"
    static var PLAYLIST_ID = "RDGMEMQ1dJ7wXfLlqCjwV0xfSNbAVM3-qru43Bp7U"
    static var API_URL = " https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(PLAYLIST_ID)&key=\(API_KEY)"
}
