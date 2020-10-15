//
//  BranchMealsCVC.swift
//  Restaurant_iOS
//
//  Created by azab on 10/5/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BranchMealsCVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pizzas: [String] = ["p1.jpg", "p2.jpg", "p3.jpg", "p4.jpg"]
    let pizzkind: [String] = ["Sicilian Pizza", "Greek Pizza", "California Pizza", "Neapolitan Pizza"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        addGradientColor()
        
        self.collectionView!.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "homeCollectionCell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //mealDetail
        let mealDetails = self.storyboard?.instantiateViewController(withIdentifier: "mealDetail") as? MealDetailsVC
               navigationController?.pushViewController(mealDetails!, animated: true)
               
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
           let viewHeight = view.frame.size.height
           let viewWidth = view.frame.size.width
           
           if view.frame.size.width > view.frame.size.height {
               return CGSize(width: (viewWidth * 0.25) - 10, height: (viewWidth * 0.29) - 10)
           }
           else {
               return CGSize(width: (viewWidth * 0.5) - 10, height: (viewHeight * 0.29) - 10)
           }
       }
    
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        
        addGradientColor()
        
    }
    
    func addGradientColor() {
           
           let collectionViewBackgroundView = UIView()
           let gradientLayer = CAGradientLayer()
           gradientLayer.frame.size = view.frame.size
           // Start and end for left to right gradient
           gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
           gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
           gradientLayer.colors = [UIColor(red:250/255, green:242/255, blue:242/255, alpha: 0.5).cgColor, UIColor(red:250/255, green:226/255, blue:266/255, alpha: 0.75).cgColor, UIColor(red:250/255, green:242/255, blue:242/255, alpha: 1.0).cgColor]
           collectionView.backgroundView = collectionViewBackgroundView
           collectionView.backgroundView?.layer.addSublayer(gradientLayer)
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:collectionView.frame.size.width, height:40.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "stCHeadCell", for: indexPath) as? HeaderSearchCollectionReusableView else {
                    fatalError("Invalid view type")
            }
            
            return headerView
        default:
            assert(false, "Invalid element type")
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return pizzas.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionCell", for: indexPath) as! HomeCollectionViewCell
        // Configure the cell
        cell.restLogo.image = UIImage(named: pizzas[indexPath.row])
        cell.restName.text = pizzkind[indexPath.row]
        cell.restHotline.text = ""
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
