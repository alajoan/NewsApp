//
//  SummaryService.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 12/08/22.
//

import Foundation

final public class SummaryService {
    public func getArticles(
        with parameter: String,
        result: @escaping (Result<SummaryRoot, Error>) -> Void
    ) {
        RequestBuilder.shared.request(parameters: parameter) { response in
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let entities = try decoder.decode(SummaryRoot.self, from: response)
                result(.success(entities))
            } catch {
                result(.failure(error))
            }
        } failure: { errorMessage, errorType, errorField, responseError in
            result(.failure(responseError))
        }
    }
    
    public func downloadArticleImages() {
        
    }
}
