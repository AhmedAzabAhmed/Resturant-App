//
//  BrandDetailsVCExtension.swift
//  Restaurant_iOS
//
//  Created by azab on 9/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit

extension BrandDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let pizzaLocations: [String] = ["Cairo", "Nasr City", "6 October", "Alexandria"]
        let arrHotline: [String] = ["19850", "12457", "85416", "12048"]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "brandCell", for: indexPath) as! BrandCollectionViewCell
        cell.brandLoc.text = pizzaLocations[indexPath.row]
        cell.brandHotline.text = arrHotline[indexPath.row]
        
        // Configure the cell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let viewHeight = collectionView.frame.size.height
        let viewWidth = view.frame.size.width
        
        if view.frame.size.width > view.frame.size.height {
            return CGSize(width: (viewWidth * 0.25) - 10, height: 237.50000000000003)
        }
        else {
            return CGSize(width: (viewWidth * 0.5) - 10, height: 237.50000000000003)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let meals = self.storyboard?.instantiateViewController(withIdentifier: "restMeals") as? BranchDetailsVC
        navigationController?.pushViewController(meals!, animated: true)
    }
}
