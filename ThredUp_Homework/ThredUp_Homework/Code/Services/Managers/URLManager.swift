//
//  URLManager.swift
//  ThredUp_Homework
//
//  Created by Mark Prutskiy on 2/10/19.
//  Copyright © 2019 Mark Prutskiy. All rights reserved.
//

import Foundation

protocol URLManagerProtocol {
    func photoURL(id: String) -> URL?
}

class URLManager {
    let mediaUrl: String
    
    init(mediaUrl: String) {
        self.mediaUrl = mediaUrl
    }
}

extension URLManager: URLManagerProtocol {
    
    func photoURL(id: String) -> URL? {
        do {
        let regex = try NSRegularExpression(pattern: ":[a-z]+_[a-z]+", options: [])
            let range = NSRange(location: 0, length: mediaUrl.utf16.count)
            guard let nsReplaceRange = regex.firstMatch(in: mediaUrl, options: [], range: range)?.range else { return nil }
            guard let replaceRange = Range(nsReplaceRange, in: mediaUrl) else { return nil }
            
            let photoUrl = mediaUrl.replacingCharacters(in: replaceRange, with: id)
            return URL(string: photoUrl)
        } catch {
            return nil
        }
    }
}
