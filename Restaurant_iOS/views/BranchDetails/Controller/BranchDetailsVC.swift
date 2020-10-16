//
//  BranchDetailsVC.swift
//  Restaurant_iOS
//
//  Created by azab on 10/4/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class BranchDetailsVC: UIViewController {
    
    @IBOutlet weak var branchBGView: UIView!
    @IBOutlet weak var branchFrontView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var ratingView: UIView!
    
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var ratingBtn: UIButton!
    
    @IBOutlet weak var BGImg: UIImageView!
    
    
    var branchMeals: BranchMealsCVC?
    var branchRating: BranchRatingTVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Meals"
        
        BGImg.clipsToBounds = true
        BGImg.layer.cornerRadius = 20
        BGImg.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        branchMeals = self.storyboard?.instantiateViewController(withIdentifier: "meals") as? BranchMealsCVC
        
        branchRating = self.storyboard?.instantiateViewController(withIdentifier: "rating") as? BranchRatingTVC
        
        containerView.addSubview(branchMeals!.view)
        self.addChild(branchMeals!)
        
        // Do any additional setup after loading the view.
        branchFrontView.layer.cornerRadius = 10
        addViewGradientColor()
    }
    
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        
        addViewGradientColor()
    }
    
    @IBAction func showView(_ sender: Any) {
        
        guard let button = sender as? UIButton else {
            return
        }
        switch button.tag {
        case 1:
            
            UIView.animate(withDuration: 1.0, delay: 0.0, options:[.allowAnimatedContent], animations: {
                
                
                self.menuView.backgroundColor = UIColor(red: 252/255, green: 43/255, blue: 43/255, alpha: 1.0)
                self.ratingView.backgroundColor = Colors.white
                
            }, completion:nil)
            
            
            UIView.transition(with: button, duration: 1.0, options: .transitionCrossDissolve, animations: {
                
                self.menuBtn.setTitleColor(UIColor(red: 252/255, green: 43/255, blue: 43/255, alpha: 1.0), for: .normal)
                self.ratingBtn.setTitleColor(.black, for: .normal)
                
            }, completion: nil)
            
            UIView.transition(with: self.containerView, duration: 1.0, options: .transitionFlipFromRight, animations: {
                
                if self.containerView != nil {
                    self.branchMeals?.removeFromParent()
                    self.branchRating?.removeFromParent()
                }
                self.containerView.addSubview(self.branchMeals!.view)
                self.addChild(self.branchMeals!)
                
            }, completion: nil)
            
            break
            
        case 2:
            
            UIView.animate(withDuration: 1.0, delay: 0.0, options:[.allowAnimatedContent], animations: {
                
                self.menuBtn.setTitleColor(.black, for: .normal)
                
                self.ratingView.backgroundColor = UIColor(red: 252/255, green: 43/255, blue: 43/255, alpha: 1.0)
                
            }, completion:nil)
            
            UIView.transition(with: button, duration: 1.0, options: .transitionCrossDissolve, animations: {
                self.ratingBtn.setTitleColor(UIColor(red: 252/255, green: 43/255, blue: 43/255, alpha: 1.0), for: .normal)
                self.menuView.backgroundColor = Colors.white
                
            }, completion: nil)
            
            UIView.transition(with: self.containerView, duration: 1.0, options: .transitionFlipFromLeft, animations: {
                
                if self.containerView != nil {
                    self.branchMeals?.removeFromParent()
                    self.branchRating?.removeFromParent()
                }
                self.containerView.addSubview(self.branchRating!.view)
                self.addChild(self.branchRating!)
                
            }, completion: nil)
            
            break
        default:
            print("Not available")
        }
    }
    
    func addViewGradientColor() {
        branchBGView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let gradient = CAGradientLayer()
        gradient.frame = branchBGView.bounds
        gradient.colors = [UIColor(red:250/255, green:242/255, blue:242/255, alpha: 0.5).cgColor, UIColor(red:250/255, green:226/255, blue:266/255, alpha: 0.75).cgColor, UIColor(red:250/255, green:242/255, blue:242/255, alpha: 1.0).cgColor]
        
        branchBGView.layer.insertSublayer(gradient, at: 0)
    }
    
}
