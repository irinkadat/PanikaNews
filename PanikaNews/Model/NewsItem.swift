//
//  NewsItem.swift
//  PanikaNews
//
//  Created by Irinka Datoshvili on 19.04.24.
//

import UIKit

struct NewsItem: Codable {
    let title: String
    let time: String
    let photoUrl: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case time = "Time"
        case photoUrl = "PhotoUrl"
    }
}

struct NewsResponse: Codable {
    let list: [NewsItem]
    
    enum CodingKeys: String, CodingKey {
        case list = "List"
    }
}
