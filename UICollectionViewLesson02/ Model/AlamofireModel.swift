//
//  AlamofireModel.swift
//  UICollectionViewLesson02
//
//  Created by UrataHiroki on 2021/07/21.
//

import Foundation
import Alamofire
import SwiftyJSON



class AlamofireModel{
    
    var searchResultDatasArray = [SearchResultDatas]()
   
    
}


extension AlamofireModel{
    
    func searchGetImageURL(searchKeyword:String,searchCount:Int){
        
        AF.request("~~~~~~~~~APIKey~~~~~~~~~&q=\(searchKeyword)", method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result{
            
            case.success:
                
                self.searchResultDatasArray = [] //以前のデータを削除
                
                let jsonResult:JSON = JSON(response.data as Any)
                
                for needDataCount in 0...searchCount - 1{
                    print(needDataCount)
                    if jsonResult["hits"][needDataCount]["webformatURL"].string != nil{
                        
                        let jsonResult = SearchResultDatas(imageURLData: jsonResult["hits"][needDataCount]["webformatURL"].string!)
                        
                        self.searchResultDatasArray.append(jsonResult)
                        
                    }else{
                        
                        break  //取得できる"webformatURL"が無くなった時に処理を終わらせる
                        
                    }
                    
                }
            
            case .failure:
                
                let error = NSError()
                print(error.debugDescription)
                break
                
            }
            
        }
        
    }
    
}
