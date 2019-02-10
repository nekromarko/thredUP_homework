//
//  App.swift
//  ThredUp_Homework
//
//  Created by Mark Prutskiy on 2/10/19.
//  Copyright © 2019 Mark Prutskiy. All rights reserved.
//

import Foundation

final class App {
    
    static let shared = App()
    
    let config: Configuration
    
    private init() {
        config = Configuration()
    }
}
