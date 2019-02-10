//
//  ItemCollectionViewCell.swift
//  ThredUp_Homework
//
//  Created by Mark Prutskiy on 2/10/19.
//  Copyright © 2019 Mark Prutskiy. All rights reserved.
//

import UIKit
import Kingfisher

protocol ItemCollectionViewCellProtocol {
    func fill(item: ItemViewModel, urlManager: URLManagerProtocol)
}

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var brandLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImageView.backgroundColor = .gray
        brandLabel.textColor = .gray
    }
}

extension ItemCollectionViewCell: ItemCollectionViewCellProtocol {
    
    func fill(item: ItemViewModel, urlManager: URLManagerProtocol) {
        if let firstPhotoID = item.photoIDs?.first, let photoURL = urlManager.photoURL(id: firstPhotoID) {
            photoImageView.kf.setImage(with: photoURL)
        } else {
            photoImageView.image = nil
        }
        
        let defaultText = "Unknown"
        titleLabel.text = item.title ?? defaultText
        brandLabel.text = item.brand ?? defaultText
        priceLabel.text = item.dollarPrice ?? defaultText
    }
}
