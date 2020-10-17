//
//  MealDetailsVC.swift
//  Restaurant_iOS
//
//  Created by azab on 10/6/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class MealDetailsVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var mealScrollView: UIScrollView!
    
    @IBOutlet weak var twisterHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var softDrinkHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var originalBtn: UIButton!
    @IBOutlet weak var spicyBtn: UIButton!
    
    @IBOutlet weak var pepsiBtn: UIButton!
    @IBOutlet weak var mirindaBtn: UIButton!
    @IBOutlet weak var up7Btn: UIButton!
    @IBOutlet weak var up7Diet: UIButton!
    
    @IBOutlet weak var twisterBtn: UIButton!
    @IBOutlet weak var drinkBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealScrollView.delegate = self
        navigationItem.title = "Meal Deatils"
        
        // Do any additional setup after loading the view.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
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
    }
    
    @IBAction func showHideBtn(_ sender: Any) {
        
        guard let button = sender as? UIButton else {
            return
        }
        switch button.tag {
        case 3:
            if twisterHeightConstraint.constant >= 82.5 {
                twisterHeightConstraint.constant = 0
                twisterBtn.setImage(UIImage(named: "upArrow"), for: .normal)
            } else {
                twisterHeightConstraint.constant = 82.5
                twisterBtn.setImage(UIImage(named: "downArrow"), for: .normal)
            }
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
            break
            
        case 4:
            if softDrinkHeightConstraint.constant >= 182 {
                softDrinkHeightConstraint.constant = 0
                drinkBtn.setImage(UIImage(named: "upArrow"), for: .normal)
            } else {
                softDrinkHeightConstraint.constant = 182
                drinkBtn.setImage(UIImage(named: "downArrow"), for: .normal)
            }
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
            break
            
            case 11:
                originalBtn.setImage(UIImage(named: "checkedRadioButton"), for: .normal)
                spicyBtn.setImage(UIImage(named: "RadioButton"), for: .normal)
            break
            
            case 12:
                
                originalBtn.setImage(UIImage(named: "RadioButton"), for: .normal)
                spicyBtn.setImage(UIImage(named: "checkedRadioButton"), for: .normal)
                
            break
             case 13:
                pepsiBtn.setImage(UIImage(named: "checkedRadioButton"), for: .normal)
                mirindaBtn.setImage(UIImage(named: "RadioButton"), for: .normal)
                up7Btn.setImage(UIImage(named: "RadioButton"), for: .normal)
                up7Diet.setImage(UIImage(named: "RadioButton"), for: .normal)
            break
             case 14:
                pepsiBtn.setImage(UIImage(named: "RadioButton"), for: .normal)
                mirindaBtn.setImage(UIImage(named: "checkedRadioButton"), for: .normal)
                up7Btn.setImage(UIImage(named: "RadioButton"), for: .normal)
                up7Diet.setImage(UIImage(named: "RadioButton"), for: .normal)
            break
             case 15:
                pepsiBtn.setImage(UIImage(named: "RadioButton"), for: .normal)
                mirindaBtn.setImage(UIImage(named: "RadioButton"), for: .normal)
                up7Btn.setImage(UIImage(named: "checkedRadioButton"), for: .normal)
                up7Diet.setImage(UIImage(named: "RadioButton"), for: .normal)
            break
             case 16:
                pepsiBtn.setImage(UIImage(named: "RadioButton"), for: .normal)
                mirindaBtn.setImage(UIImage(named: "RadioButton"), for: .normal)
                up7Btn.setImage(UIImage(named: "RadioButton"), for: .normal)
                up7Diet.setImage(UIImage(named: "checkedRadioButton"), for: .normal)
            break
        case 17:
            self.showToast(message: "Successfully Added !!", font: .systemFont(ofSize: 12.0))

            break
        default:
            print("Not available")
        }
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
