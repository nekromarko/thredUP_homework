//
//  Item.swift
//  ThredUp_Homework
//
//  Created by Mark Prutskiy on 2/10/19.
//  Copyright © 2019 Mark Prutskiy. All rights reserved.
//

import ObjectMapper

protocol ItemViewModel {
    var photoIDs: [String]? { get }
    var title: String? { get }
    var brand: String? { get }
    var dollarPrice: String? { get }
}

class Item: Mappable, ItemViewModel {
    var id: Int!
    var photoIDs: [String]?
    var title: String?
    var brand: String?
    var price: String?
    var dollarPrice: String? {
        guard let price = price else { return nil }
        return "$".appending(price)
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        photoIDs <- map["photo_ids"]
        title <- map["title"]
        brand <- map["brand"]
        price <- map["price"]
    }
}
