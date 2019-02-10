//
//  HomeRouter.swift
//  ThredUp_Homework
//
//  Created by Mark Prutskiy on 2/10/19.
//  Copyright © 2019 Mark Prutskiy. All rights reserved.
//

import Alamofire

enum HomeRouter: URLRequestConvertible {
    case get
    
    static let path = "tup/iOS/Interview/Sample_Content.json"
    var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let params: ([String: Any]?) = {
            switch self {
            case .get:
                return nil
            }
        }()
        
        let url: URL = {
            let relativePath: String?
            switch self {
            case .get:
                relativePath = HomeRouter.path
            }
            
            var url = baseUrl
            if let relativePath = relativePath {
                url = url.appendingPathComponent(relativePath)
            }
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding: ParameterEncoding = {
            switch self {
            case .get:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: params)
    }
}
