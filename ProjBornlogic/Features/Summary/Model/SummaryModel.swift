//
//  SummaryModel.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 12/08/22.
//

import Foundation

public struct SummaryRoot: Decodable {
    var articles: [Articles]
}

public struct Articles: Decodable {
    var title: String?
    var description: String?
    var urlToImage: String?
}
