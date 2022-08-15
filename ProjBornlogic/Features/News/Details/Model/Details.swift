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
    
    init(image: UIImage, publishedAt: String, content: String) {
        self.image = image
        self.publishedAt = publishedAt
        self.content = content
    }
    
}

