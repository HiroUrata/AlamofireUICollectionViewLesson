//
//  ViewController.swift
//  UICollectionViewLesson02
//
//  Created by UrataHiroki on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchKeywordTextField: UITextField!
    @IBOutlet weak var searchCountTextField: UITextField!
    
    
    let alamofireModel = AlamofireModel()
    let activityIndicator = ActivityIndicator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        activityIndicator.createIndicator(targetView: self.view)
        
    }
    
    @IBAction func Search(_ sender: UIButton) {
        
        alamofireModel.searchGetImageURL(searchKeyword: searchKeywordTextField.text!, searchCount: Int(searchCountTextField.text!)!)
        
        activityIndicator.uiActivityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
            let collectionVC = self.storyboard?.instantiateViewController(identifier: "collectionVC") as! CollectionViewController
            
            collectionVC.receiveResultJSONArray = []
            collectionVC.receiveResultJSONArray = self.alamofireModel.searchResultDatasArray
            
            self.activityIndicator.uiActivityIndicator.stopAnimating()
            
            self.navigationController?.pushViewController(collectionVC, animated: true)
            
            
        }
        
    }
    
}

