//
//  APIHome.swift
//  ThredUp_Homework
//
//  Created by Mark Prutskiy on 2/10/19.
//  Copyright © 2019 Mark Prutskiy. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

protocol APIHomeProtocol {
    func getHome(completion: @escaping (DataResponse<HomeResponse>) -> Void)
}

class APIHome: API, APIHomeProtocol {
    
    func getHome(completion: @escaping (DataResponse<HomeResponse>) -> Void) {
        request(HomeRouter.get)
            .responseObject { (response: DataResponse<HomeResponse>) in
                completion(response)
        }
    }
}
