//
//  DetailService.swift
//  ProjBornlogic
//
//  Created Jonathan Alajoan Nascimento Rocha on 16/08/22.
//

import Foundation

final public class DetailService {
    public func downloadArticleHTML(
        from url: String,
        result: @escaping (Result<String, Error>) -> Void
    ) {
        RequestBuilder.shared.request(urlForDownload: url) { response in
            let html = String(
                data: response, encoding: .ascii)
            result(.success(html ?? ""))
//            do {
//                try result(.success(NSAttributedString(data: response, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)))
//            }  catch {
//                result(.failure(error))
//            }
        } failure: { errorMessage, errorType, errorField, responseError in
            result(.failure(responseError))
        }
    }
}
