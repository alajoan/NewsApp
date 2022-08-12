//
//  UIImageExtensions.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 12/08/22.
//

import UIKit

extension UIImageView {
    func makeRoundCorners(byRadius rad: CGFloat) {
          self.layer.cornerRadius = rad
          self.clipsToBounds = true
    }
}
