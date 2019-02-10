//
//  URLRequestConvertible+Convenience.swift
//  ThredUp_Homework
//
//  Created by Mark Prutskiy on 2/10/19.
//  Copyright © 2019 Mark Prutskiy. All rights reserved.
//

import Alamofire

extension URLRequestConvertible {
    
    var baseUrl: URL {
        return URL(string: App.shared.config.baseUrl)!
    }
}
