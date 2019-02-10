//
//  InspectorViewController+Layouts.swift
//  ThredUp_Homework
//
//  Created by Mark Prutskiy on 2/10/19.
//  Copyright © 2019 Mark Prutskiy. All rights reserved.
//

import UIKit
import Kingfisher

extension InspectorViewController {
    
    func setupLayouts() {
        title = "Inspector"
        
        if let firstPhotoID = item.photoIDs?.first, let photoURL = urlManager.photoURL(id: firstPhotoID) {
            photoImageView.kf.setImage(with: photoURL)
        }
        
        let defaultText = "Unknown"
        titleLabel.text = item.title ?? defaultText
        brandLabel.text = item.brand ?? defaultText
        brandLabel.textColor = .gray
        priceLabel.text = item.dollarPrice ?? defaultText
    }
}
