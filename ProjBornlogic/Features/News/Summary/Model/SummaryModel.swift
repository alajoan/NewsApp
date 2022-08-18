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

//MARK: - Validations
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
        let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
            let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
            let result = urlTest.evaluate(with: url)
        return !url.isEmpty && result
    }
    
    func publishedAtValid() -> Bool {
        guard let publishedAt = publishedAt else { return false }
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return !publishedAt.isEmpty && (dateFormatterGet.date(from: publishedAt) != nil)
    }
    
    func contentValid() -> Bool {
        guard let content = content else { return false }
        return !content.isEmpty && content.count > 10
    }
    
    func authorValid() -> Bool {
        guard let author = author else { return false }
        guard author.count > 7, author.count < 18 else { return false }
        let urlRegex = "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$"
        let predicateTest = NSPredicate(format: "SELF MATCHES %@", urlRegex)
        
        return !author.isEmpty && predicateTest.evaluate(with: author)
    }
}
