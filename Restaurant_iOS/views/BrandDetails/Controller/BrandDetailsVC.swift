//
//  BrandDetailsVC.swift
//  Restaurant_iOS
//
//  Created by azab on 9/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class BrandDetailsVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var brandScrollView: UIScrollView!
    
    @IBOutlet weak var brandCollectionView: UICollectionView!
    
    @IBOutlet weak var brandView: UIView!
    
    @IBOutlet weak var BGGradientView: UIView!
    
    @IBOutlet weak var brandHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var loginImg: UIImageView!
    
    
    var reached : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brandScrollView.delegate = self
        
        navigationItem.title = "Branches"
        
        loginImg.clipsToBounds = true
        loginImg.layer.cornerRadius = 20
        loginImg.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        // Do any additional setup after loading the view.
//        addGradientColor()
//        addViewGradientColor()
        
        brandView.layer.cornerRadius = 10
        self.brandCollectionView!.register(UINib(nibName: "BrandCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "brandCell")
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
        brandCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let collectionViewBackgroundView = UIView()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame.size = brandCollectionView.frame.size
        // Start and end for left to right gradient
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.colors = [UIColor(red:250/255, green:242/255, blue:242/255, alpha: 0.5).cgColor, UIColor(red:250/255, green:226/255, blue:266/255, alpha: 0.75).cgColor, UIColor(red:250/255, green:242/255, blue:242/255, alpha: 1.0).cgColor]
        brandCollectionView.backgroundView = collectionViewBackgroundView
        brandCollectionView.backgroundView?.layer.addSublayer(gradientLayer)
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
            
//            brandHeightConstraint.constant += 237.50000000000003
            
            UIView.animate(withDuration: 2.0) { //1
                self.addGradientColor()
            }
            
        } else if !reached && (scrollView.contentOffset.y <= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            reached = true
        }
        
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
            
              UIView.animate(withDuration: 0.8, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(true, animated: true)
                self.navigationController?.setToolbarHidden(true, animated: true)
              }, completion: nil)
            
            
        } else {
            UIView.animate(withDuration: 0.8, delay: 0, options: UIView.AnimationOptions(), animations: {
              self.navigationController?.setNavigationBarHidden(false, animated: true)
              self.navigationController?.setToolbarHidden(false, animated: true)
            }, completion: nil)
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
