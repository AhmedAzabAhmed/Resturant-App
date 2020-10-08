//
//  BranchDetailsVC.swift
//  Restaurant_iOS
//
//  Created by azab on 9/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class BrandDetailsVC: UIViewController {
    
    
    @IBOutlet weak var branchCollectionView: UICollectionView!
    
    @IBOutlet weak var brandView: UIView!
    
    @IBOutlet weak var BGGradientView: UIView!
    
    @IBOutlet weak var branchHeightConstraint: NSLayoutConstraint!
    
    var reached : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        addGradientColor()
//        addViewGradientColor()
        
        brandView.layer.cornerRadius = 10
        self.branchCollectionView!.register(UINib(nibName: "BranchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "branchCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        addGradientColor()
        addViewGradientColor()
    }
    func addViewGradientColor() {
        BGGradientView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let gradient = CAGradientLayer()
        gradient.frame = BGGradientView.bounds
        gradient.colors = [UIColor(red:250/255, green:242/255, blue:242/255, alpha: 0.5).cgColor, UIColor(red:250/255, green:226/255, blue:266/255, alpha: 0.75).cgColor, UIColor(red:250/255, green:242/255, blue:242/255, alpha: 1.0).cgColor]
        
        BGGradientView.layer.insertSublayer(gradient, at: 0)
    }
    
    // MARK: addGradientColorToCollectionView
    func addGradientColor() {
        branchCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let collectionViewBackgroundView = UIView()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame.size = branchCollectionView.frame.size
        // Start and end for left to right gradient
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.colors = [UIColor(red:250/255, green:242/255, blue:242/255, alpha: 0.5).cgColor, UIColor(red:250/255, green:226/255, blue:266/255, alpha: 0.75).cgColor, UIColor(red:250/255, green:242/255, blue:242/255, alpha: 1.0).cgColor]
        branchCollectionView.backgroundView = collectionViewBackgroundView
        branchCollectionView.backgroundView?.layer.addSublayer(gradientLayer)
    }

    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {

        addViewGradientColor()
        addGradientColor()
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if reached && (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            //reach bottom
            reached = false
            print("Done!")
            
            branchHeightConstraint.constant += 237.50000000000003
            
            UIView.animate(withDuration: 2.0) { //1
                self.addGradientColor()
            }
            
        } else if !reached && (scrollView.contentOffset.y <= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            reached = true
        }
        
//        if (scrollView.contentOffset.y < 0){
//            //reach top
//        }
//
//        if (scrollView.contentOffset.y >= 0 && scrollView.contentOffset.y < (scrollView.contentSize.height - scrollView.frame.size.height)){
//            //not top and not bottom
//        }
    }
    
}
