//
//  ArrayExtensions.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 13/08/22.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
