//
//  SummaryModel.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 12/08/22.
//

import Foundation

public struct SummaryRoot: Decodable {
    var articles: [Articles]?
    
    init(articles: [Articles]) {
        self.articles = articles
    }
}

public struct Articles: Decodable {
    var title: String?
    var description: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    var author: String?
    
    init(
        title: String = "",
        description: String = "",
        urlToImage: String = "",
        publishedAt: String = "",
        content: String = "",
        author: String = ""
    ) {
        self.title = title
        self.description = description
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
        self.author = author
    }
}

extension SummaryRoot {
    func isArticleValid() -> Bool {
        guard let article = articles else { return false }
        return article.count > 0
    }
}

extension Articles {
    func isTitleValid() -> Bool {
        guard let title = title else { return false }
        return !title.isEmpty && title.count > 1
    }
    
    func isDescriptionValid() -> Bool {
        guard let description = description else { return false }
        return !description.isEmpty && description.count > 10
    }
    
    func urlToImageValid() -> Bool {
        guard let url = urlToImage else { return false }
        return !url.isEmpty && url.count > 1 && url.contains("https://")
    }
    
    func publishedAtValid() -> Bool {
        guard let publishedAt = publishedAt else { return false }
        return !publishedAt.isEmpty && publishedAt.count > 8
    }
    
    func contentValid() -> Bool {
        guard let content = content else { return false }
        return !content.isEmpty && content.count > 1
    }
}
