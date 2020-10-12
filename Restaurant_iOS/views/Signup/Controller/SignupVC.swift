//
//  SignupVC.swift
//  Restaurant_iOS
//
//  Created by azab on 9/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {
    
    @IBOutlet weak var nameView: UIView!
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var confirmPassView: UIView!
    
    @IBOutlet weak var phonView: UIView!
    @IBOutlet weak var registerBtn: UIButton!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPassField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        registerBtn.layer.cornerRadius = 10
        
        makePlaceHolder(text: "Name", textFeild: nameField)
        makePlaceHolder(text: "Email", textFeild: emailField)
        makePlaceHolder(text: "Password", textFeild: passwordField)
        makePlaceHolder(text: "Confirm Password", textFeild: confirmPassField)
        makePlaceHolder(text: "Phone", textFeild: phoneField)
        
        let gradientView = GradientView(frame: self.view.bounds)
        gradientView.isOpaque = false
        gradientView.alpha = CGFloat(0.9)
        self.view.insertSubview(gradientView, at: 1)
        
         roundViewWithborder(myView: emailView, conerRaduis: 20)
         roundViewWithborder(myView: passwordView, conerRaduis: 20)
         roundViewWithborder(myView: nameView, conerRaduis: 20)
         roundViewWithborder(myView: confirmPassView, conerRaduis: 20)
         roundViewWithborder(myView: phonView, conerRaduis: 20)
    }
    
    func makePlaceHolder(text: String, textFeild: UITextField ) {
        
        textFeild.attributedPlaceholder = NSAttributedString(string: text,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    func roundViewWithborder(myView: UIView, conerRaduis: CGFloat) {
        myView.layer.borderWidth = 1
        myView.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1).cgColor
        myView.layer.cornerRadius = conerRaduis
        
        myView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        
        //        myView.frame = CGRect(x: 0, y: myView.frame.size.height - myView.layer.borderWidth,width: myView.frame.size.width, height: myView.layer.borderWidth)
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
