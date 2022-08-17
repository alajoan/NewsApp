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
    
    func getDetailTitle() -> String {
        guard let detailTitle = data?.title else { return "" }
        return detailTitle
    }
    
    func getDetailImage() -> UIImage {
        guard let detailImage = data?.image else { return UIImage() }
        return detailImage
    }
    
    func getDetailPublishedAtBy() -> String {
        guard
            let detailPublishedAt = data?.publishedAt,
            let author = data?.author
        else { return "" }
        return "Article by: \(author) on \(Date.getFormattedDate(string: detailPublishedAt))"
    }
    
    func getDetailContent() -> String {
        guard let detailContent = data?.content else { return "" }
        return detailContent
    }
}
