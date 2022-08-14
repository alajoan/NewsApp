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
    
    public func buildUrlRequest(url: String = "", method: Method) -> URLRequest?
    {
        guard let downloadUrl = URL(string: url) else { return nil }
        
        var URLRequest = URLRequest(
            url: downloadUrl,
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 30
        )
        URLRequest.httpMethod = method.rawValue
        return URLRequest
    }
    
    public func request(method: Method = .get,
                        parameters: String = "",
                        urlForDownload: String = "",
                        success: @escaping (Data) -> Void,
                        failure: @escaping (_ errorMessage: String,
                                            _ errorType: String,
                                            _ errorField: String,
                                            _ responseError: Error) -> Void)
    {
        let urlComplete = "\(BaseUrl.baseURL)?q=\(parameters)&apiKey=\(BaseUrl.apiKey)"
        
        guard let URLRequest = buildUrlRequest(
            url: urlForDownload != "" ? urlForDownload : urlComplete,
            method: .get
        ) else { return }
        
        URLSession.shared.dataTask(with: URLRequest) { [weak self] data, response, error in
            let response = response as? HTTPURLResponse
            let status = response?.statusCode
            
            guard
                let data = data,
                let _ = response,
                let status = status
            else { return }
            
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
