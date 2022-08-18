//
//  Details.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 15/08/22
//

import Foundation
import UIKit

struct Details {
    var image: UIImage
    var publishedAt: String
    var content: String
    var title: String
    var author: String
    
    init(image: UIImage, publishedAt: String, content: String, title: String, author: String) {
        self.image = image
        self.publishedAt = publishedAt
        self.content = content
        self.title = title
        self.author = author
    }
}
