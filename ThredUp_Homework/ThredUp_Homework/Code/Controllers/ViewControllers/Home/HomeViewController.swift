//
//  ViewController.swift
//  ThredUp_Homework
//
//  Created by Mark Prutskiy on 2/10/19.
//  Copyright © 2019 Mark Prutskiy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    let showInspectorViewControllerID = "showInspectorViewController"
    
    var items: [ItemViewModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    var selectedItem: ItemViewModel!
    var urlManager: URLManagerProtocol!
    let API = APIHome()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupLayouts()
        loadHome()
    }
}

// MARK: Networking

extension HomeViewController {
    
    func loadHome() {
        // show loading hud
        API.getHome { [unowned self] (response) in
            // hide loading hud
            guard response.error == nil else {
                // show error
                return
            }
            guard let value = response.result.value else { return }
            
            self.urlManager = URLManager(mediaUrl: value.photoUrlFormat)
            self.items.append(contentsOf: value.items)
        }
    }
}

// MARK: Navigation

extension HomeViewController {
    
    func showInspectorViewController() {
        performSegue(withIdentifier: showInspectorViewControllerID, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showInspectorViewControllerID,
            let viewController = segue.destination as? InspectorViewController {
            viewController.item = selectedItem
            viewController.urlManager = urlManager
        }
    }
}

