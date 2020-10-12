//
//  MealDetailsVC.swift
//  Restaurant_iOS
//
//  Created by azab on 10/6/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class MealDetailsVC: UIViewController {
    
    
    @IBOutlet weak var twisterHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var softDrinkHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showHideBtn(_ sender: Any) {
        
        guard let button = sender as? UIButton else {
            return
        }
        switch button.tag {
        case 3:
            if twisterHeightConstraint.constant >= 82.5 {
                twisterHeightConstraint.constant = 0
                
            } else {
                twisterHeightConstraint.constant = 82.5
            }
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
            break
            
        case 4:
            if softDrinkHeightConstraint.constant >= 182 {
                softDrinkHeightConstraint.constant = 0
                
            } else {
                softDrinkHeightConstraint.constant = 182
            }
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
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
