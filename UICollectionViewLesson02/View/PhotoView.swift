//
//  PhotoView.swift
//  UICollectionViewLesson02
//
//  Created by UrataHiroki on 2021/07/22.
//

import Foundation
import UIKit

class PhotoView{
    
    let photoView = UIView()
    
}


extension PhotoView{
    
    func createPhotoView(cellPointX:CGFloat,cellPointY:CGFloat,cellWidth:CGFloat,cellHeight:CGFloat,targetView:UIView){
        
        photoView.frame = CGRect(x: cellPointX, y: cellPointY, width: cellWidth, height:cellHeight)
        
        photoView.backgroundColor = .white
        
        targetView.addSubview(photoView)
    
    }
}
