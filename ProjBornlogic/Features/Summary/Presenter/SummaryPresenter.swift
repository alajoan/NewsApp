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
        service.getArticles(with: parameters) { [weak self] result in
            self?.view?.didStopLoading()
            switch result {
            case .success(let root):
                self?.articles = root.articles
                self?.numberOfRows = root.articles.count
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
}
