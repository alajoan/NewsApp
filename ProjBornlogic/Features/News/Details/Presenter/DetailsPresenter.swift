//
//  DetailsPresenter.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 15/08/22.
//

import Foundation
import UIKit

final class DetailsPresenter {
    var data: Details?
    let service = DetailService()
    
    func getHTML() {
        service.downloadArticleHTML(from: "https://www.theverge.com/2022/8/12/23303095/apple-meta-facebook-ad-sales-subscription") { result in
            switch result {
            case .success(let data):
                print(data.matchingStrings(regex: "<div[^>]*?class='content'[^>]*?>(.*?)</div>"))
            case .failure(let data):
                print(data)
            }
        }
    }
    
    func getDetailTitle() -> String {
        guard let detailTitle = data?.title else { return "" }
        return detailTitle
    }
    
    func getDetailImage() -> UIImage {
        guard let detailImage = data?.image else { return UIImage() }
        return detailImage
    }
    
    func getDetailPublishedAt() -> String {
        guard let detailPublishedAt = data?.publishedAt else { return "" }
        return detailPublishedAt
    }
    
    func getDetailContent() -> String {
        guard let detailContent = data?.content else { return "" }
        return detailContent
    }
}
