//
//  SummaryPresenter.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 11/08/22.
//

import Foundation
import UIKit

final class SummaryPresenter {
    func setImages() -> [UIImage] {
        var images: [UIImage] = []
        images.append(UIImage(named: "Image1") ?? UIImage())
        images.append(UIImage(named: "Image2") ?? UIImage())
        images.append(UIImage(named: "Image3") ?? UIImage())
        return images
    }
    
    func setTexts() -> [String] {
        var texts: [String] = []
        texts.append("Why I'm trading the Galaxy Watch 4 Classic for the Watch 5 Pro")
        texts.append("Pico 4 Pro specs appear right after Oculus Quest 2's price hike")
        texts.append("Apple reportedly wants podcast deals that can lead to TV shows")
        return texts
    }
    
    func setDescriptions() -> [String] {
        var descriptions: [String] = []
        descriptions.append("The Galaxy Watch 5 Pro presents an interesting case for those deciding whether they should upgrade. Here's why I've decided to ditch the Watch 4 Classic for Samsung's most expensive smartwatch.")
        descriptions.append("Meta may have the VR market cornered with the Oculus Quest but a leak of new images and specs for ByteDance's Pico 4 Pro looks like it's ready to create some serious competition.")
        descriptions.append("Apple is no stranger to basing TV shows on podcasts, but it now appears eager to snap up that content as quickly as possible. Bloombergsources claim Apple has signed a deal with Suave producer Futuro Studios that will fund podcasts in return for the first cha…")
        return descriptions
    }
}
