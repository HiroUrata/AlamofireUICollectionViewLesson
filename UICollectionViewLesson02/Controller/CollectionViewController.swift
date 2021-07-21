//
//  CollectionViewController.swift
//  UICollectionViewLesson02
//
//  Created by UrataHiroki on 2021/07/21.
//

import UIKit
import SDWebImage

class CollectionViewController: UIViewController{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let collectionViewFlowLayout = UICollectionViewFlowLayout()
    
    var receiveResultJSONArray = [SearchResultDatas]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionView.collectionViewLayout = collectionViewFlowLayout
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.reloadData()
    }
  
    
   
    }
    
    
extension CollectionViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.receiveResultJSONArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let cellImageView = cell.contentView.viewWithTag(1) as! UIImageView
        
        cellImageView.frame = CGRect(x: cell.bounds.minX, y: cell.bounds.minY, width: cell.frame.size.width, height: cell.frame.size.height)
        
        cellImageView.contentMode = .scaleAspectFill
        
        cellImageView.sd_setImage(with: URL(string: self.receiveResultJSONArray[indexPath.row].imageURLData), completed: nil)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: collectionView.frame.size.width / 4 - 10, height: collectionView.frame.size.width / 4 - 10)
            
        }
    
    
    

}
