//
//  SummaryPresenter.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 11/08/22.
//

import Foundation
import UIKit

protocol SummaryPresenterDelegate {
    func didStartLoading()
    func didStopLoading()
    func reloadTableView()
}

final class SummaryPresenter {
    let service = SummaryService()
    
    var view: SummaryPresenterDelegate?
    var articleImages: [UIImage] = []
    var articles: [Articles]?
    var numberOfRows = 0
    
    init(view: SummaryPresenterDelegate) {
        self.view = view
    }
    
    func getArticles(with parameters: String) {
        self.view?.didStartLoading()
        articles = []
        service.getArticles(with: parameters) { [weak self] result in
            switch result {
            case .success(let root):
                guard let articleCounts = root.articles?.count else { return }
                self?.articles = root.articles
                self?.numberOfRows = articleCounts
                self?.view?.reloadTableView()
                self?.getArticleImages()
                break
            case .failure(_):
                return
            }
        }
    }
    
    func getArticleImages() {
        guard let articles = self.articles else { return }
        articleImages = []
        DispatchQueue.main.async {
            self.view?.didStopLoading()
        }
        
        articles.forEach { article in
            guard let articleUrlImage = article.urlToImage else { return }
            service.downloadArticleImages(from: articleUrlImage) { [weak self] result in
                switch result {
                case .success(let image):
                    guard let convertedImage = UIImage(data: image, scale: 0.5) else { return }
                    self?.articleImages.append(convertedImage)
                    self?.view?.reloadTableView()
                    break
                case .failure(_):
                    return
                }
            }
        }
    }
    
    func getArticleImage(at index: Int) -> UIImage {
        guard let articleImages = articleImages[safe: index] else { return UIImage() }
        return articleImages
    }
    
    func getArticleTitle(at index: Int) -> String {
        guard let articleTitle = articles?[index].title else { return "" }
        return articleTitle
    }
    
    func getArticleDescription(at index: Int) -> String {
        guard let articleDescription = articles?[index].description else { return "" }
        return articleDescription
    }
    
    func getDetailData(at index: Int) -> Details {
        guard
            let publishedAt = articles?[index].publishedAt,
            let content = articles?[index].content,
            let title = articles?[index].title,
            let author = articles?[index].author
        else {
            return Details(
                image: UIImage(),
                publishedAt: "",
                content: "",
                title: "",
                author: ""
            )
        }
        
        return Details(
            image: getArticleImage(at: index),
            publishedAt: publishedAt,
            content: content,
            title: title,
            author: author
        )
    }
    
    func getArticleAuthor(at index: Int) -> String {
        guard let articleAuthor = articles?[index].author else { return "" }
        return "Author: \(articleAuthor)"
    }
}
