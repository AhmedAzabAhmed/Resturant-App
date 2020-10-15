//
//  ViewController.swift
//  Restaurant_iOS
//
//  Created by Hassan Khamis on 8/3/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //    @IBOutlet weak var testLabel: UILabel!
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var loginBtn: UIButton!
    
    //    @IBOutlet weak var loginScrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        testLabel.font = UIFont.init(name: FontFamilyPalmSoft.regular, size: FontSize.medium)
        //        view.backgroundColor = Colors.primary
        
        //         bgView.backgroundColor = UIColor(patternImage: UIImage(named: "loginBG.png")!)
        
        //        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "loginBG.png")!)
        //        addGradientColor()
        
        //        self.loginScrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height + 2000)
        
        makePlaceHolder(text: "Email", textFeild: emailField)
        makePlaceHolder(text: "Password", textFeild: passwordField)
        
        loginBtn.layer.cornerRadius = 10
        
        roundViewWithborder(myView: emailView, conerRaduis: 20)
        
        roundViewWithborder(myView: passwordView, conerRaduis: 20)
        
        let gradientView = GradientView(frame: self.view.bounds)
        gradientView.isOpaque = false
        gradientView.alpha = CGFloat(0.9)
        self.view.insertSubview(gradientView, at: 1)
    }
    
    @IBAction func goToHome(_ sender: Any) {
        
        guard let button = sender as? UIButton else {
            return
        }
        switch button.tag {
        case 8:
            let home = self.storyboard?.instantiateViewController(withIdentifier: "home") as? HomeCollectionViewController
            self.present(home!, animated: true, completion: nil)
            break
        case 9:
            let reset = self.storyboard?.instantiateViewController(withIdentifier: "reset") as? ForgetPasswordVC
            self.present(reset!, animated: true, completion: nil)
            break
        case 10:
            let signup = self.storyboard?.instantiateViewController(withIdentifier: "signup") as? SignupVC
            self.present(signup!, animated: true, completion: nil)
            break
            
        default: break
            
        }
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
    
    //    func addGradientColor() {
    //
    //        let gradient = CAGradientLayer()
    //        gradient.frame = bgView.bounds
    //        gradient.colors = [UIColor(red:45/255, green:45/255, blue:45/255, alpha: 0.5).cgColor, UIColor(red:8/255, green:8/255, blue:8/255, alpha: 0.75).cgColor, UIColor(red:0/255, green:0/255, blue:0/255, alpha: 1.0).cgColor]
    //
    //        bgView.layer.insertSublayer(gradient, at: 0)
    //    }
}

