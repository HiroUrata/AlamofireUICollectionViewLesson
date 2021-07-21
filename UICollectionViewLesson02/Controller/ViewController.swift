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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func Search(_ sender: UIButton) {
        
        self.alamofireModel.searchGetImageURL(searchKeyword: searchKeywordTextField.text!, searchCount: Int(searchCountTextField.text!)!)
        
        let collectionVC = storyboard?.instantiateViewController(identifier: "collectionVC") as! CollectionViewController
        
        self.navigationController?.pushViewController(collectionVC, animated: true)
        
    }
    
}

