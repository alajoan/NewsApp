//
//  RequestBuilder.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 11/08/22.
//

import Foundation

final public class RequestBuilder {
    public static let shared = RequestBuilder()
    
    private init() {}
    
    public func buildUrlRequest(method: Method,
                                endpoint: String,
                                parameters: [String: Any]
                                ) -> URLRequest?
    {
        let urlComponents = NSURLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = BaseUrl.baseURL
        urlComponents.path = endpoint
        
        var queryItem: [URLQueryItem] = []
        let queryParameters = parameters.map({URLQueryItem(name: $0.key, value: $0.value as? String)})
        queryItem.append(contentsOf: queryParameters)
        
        guard let completeUrl = urlComponents.url else { return nil }
        
        let URLRequest = URLRequest(url: completeUrl, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
        
        return URLRequest
    }
    
    public func request(method: Method,
                        endpoint: String,
                        parameters: [String: Any],
                        success: @escaping (Data) -> Void,
                        failure: @escaping (_ errorMessage: String,
                                            _ errorType: String,
                                            _ errorField: String,
                                            _ responseError: Error) -> Void)
    {
        guard let URLRequest = buildUrlRequest(
            method: method,
            endpoint: endpoint,
            parameters: parameters
        ) else { return }
        
        URLSession.shared.dataTask(with: URLRequest) { data, response, error in
            let response = response as! HTTPURLResponse
            let status = response.statusCode
            
            guard let data = data else { return }
            
            if let error = error {
                switch status {
                case 400...499:
                        failure("Client error", "Client Error", "", error)
                    return
                case 500...99:
                        failure("Page not found", "Page not found", "", error)
                    return
                    default:
                        failure("Error found", "Error found", "", error)
                    return
                }
            }
            
            switch status {
                case 200...209:
                    success(data)
                default:
                return
            }
        }.resume()
    }
}
