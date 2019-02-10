//
//  InspectorViewController.swift
//  ThredUp_Homework
//
//  Created by Mark Prutskiy on 2/10/19.
//  Copyright © 2019 Mark Prutskiy. All rights reserved.
//

import UIKit

class InspectorViewController: UIViewController {
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var brandLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var buyButton: UIButton!
    
    var urlManager: URLManagerProtocol!
    var item: ItemViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayouts()
    }
}
