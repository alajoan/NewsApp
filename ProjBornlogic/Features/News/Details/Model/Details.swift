//
//  Details.swift
//  ProjBornlogic
//
//  Created by user226597 on 8/15/22.
//

import Foundation
import UIKit

struct Details {
    var image: UIImage
    var publishedAt: String
    var content: String
    var title: String
    
    init(image: UIImage, publishedAt: String, content: String, title: String) {
        self.image = image
        self.publishedAt = publishedAt
        self.content = content
        self.title = title
    }
    
}

