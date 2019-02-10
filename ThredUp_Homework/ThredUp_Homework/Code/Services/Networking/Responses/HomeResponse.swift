//
//  HomeResponse.swift
//  ThredUp_Homework
//
//  Created by Mark Prutskiy on 2/10/19.
//  Copyright © 2019 Mark Prutskiy. All rights reserved.
//

import ObjectMapper

class HomeResponse: Mappable {
    var items: [Item]!
    var photoUrlFormat: String!
    
    required init?(map: Map) {
        if map.JSON["items"] == nil ||
            map.JSON["photo_url_format"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
        items <- map["items"]
        photoUrlFormat <- map["photo_url_format"]
    }
}
