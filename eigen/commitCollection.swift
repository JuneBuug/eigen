//
//  commitCollection.swift
//  eigen
//
//  Created by 준킴 on 2018. 7. 12..
//  Copyright © 2018년 junebuug. All rights reserved.
//


import UIKit

class commitCollection: UIView,UICollectionViewDataSource,UICollectionViewDelegate{
    
  
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor.clear
        
        let nibCell = UINib(nibName: "commitCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "commitCell")
        collectionView.dataSource = self
        collectionView.delegate = self
      
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "commitCollection", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "commitCell", for: indexPath) as! commitCell
        
        if indexPath.row % 4 == 0 {
            cell.background.backgroundColor = UIColor(red: 211.0/255.0, green: 214.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        }
        else if indexPath.row % 4 == 1 {
            cell.background.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        }
        else if indexPath.row % 4 == 2 {
            cell.background.backgroundColor = UIColor(red: 148.0/255.0, green: 191.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        }
        else{
            cell.background.backgroundColor = UIColor(red: 100.0/255.0, green: 165.0/255.0, blue: 241.0/255.0, alpha: 1.0)
        }
        
        return cell
    }
    
}
