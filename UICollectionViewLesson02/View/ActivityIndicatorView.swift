//
//  ActivityIndicatorView.swift
//  UICollectionViewLesson02
//
//  Created by UrataHiroki on 2021/07/21.
//

import Foundation
import UIKit

class ActivityIndicator:UIViewController{
    
    let uiActivityIndicator = UIActivityIndicatorView()
    
}


extension ActivityIndicator{
    
    func createIndicator(targetView:UIView){
        
        self.uiActivityIndicator.center = targetView.center
        self.uiActivityIndicator.color = .white
        self.uiActivityIndicator.style = .large
        
        targetView.addSubview(self.uiActivityIndicator)
        
    }
    
}
