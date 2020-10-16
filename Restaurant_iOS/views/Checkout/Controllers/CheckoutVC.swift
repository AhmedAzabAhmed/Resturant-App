//
//  CheckoutVC.swift
//  Restaurant_iOS
//
//  Created by azab on 10/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class CheckoutVC: UIViewController {
    
    @IBOutlet weak var checkoutContainerView: UIView!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var deliveryBtn: UIButton!
    @IBOutlet weak var addressBtn: UIButton!
    @IBOutlet weak var paymentBtn: UIButton!
    
    @IBOutlet weak var saveAddView: UIStackView!
    @IBOutlet weak var saveLbl: UILabel!
    
    var delivery: DeliveryTVC?
    var address: AdressVC?
    var payment: PaymentVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView.clipsToBounds = true
        topView.layer.cornerRadius = 70
        topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        delivery = self.storyboard?.instantiateViewController(withIdentifier: "delivery") as? DeliveryTVC
        
        address = self.storyboard?.instantiateViewController(withIdentifier: "address") as? AdressVC
        
        payment = self.storyboard?.instantiateViewController(withIdentifier: "payment") as? PaymentVC
        
        buildDelivery()
        
        // Do any additional setup after loading the view.
        nextBtn.layer.cornerRadius = 25
        
    }
    
    @IBAction func swapBetweenViews(_ sender: Any) {
        
        guard let button = sender as? UIButton else {
            return
        }
        switch button.tag {
        case 5:
            
            buildDelivery()
            
            UIView.transition(with: sender as! UIView, duration: 1.0, options: .transitionFlipFromRight, animations: {
                self.deliveryBtn.setImage(UIImage(named: "checkedDelivery"), for: .normal)
                self.addressBtn.setImage(UIImage(named: "Address"), for: .normal)
                self.paymentBtn.setImage(UIImage(named: "Payment"), for: .normal)
            }, completion: nil)
            
            break
        case 6:
            buildAddress()
            
            saveLbl.text = "Save new address"

            UIView.transition(with: sender as! UIView, duration: 1.0, options: .transitionFlipFromRight, animations: {
                self.deliveryBtn.setImage(UIImage(named: "Delivery"), for: .normal)
                self.addressBtn.setImage(UIImage(named: "checkedAddress"), for: .normal)
                self.paymentBtn.setImage(UIImage(named: "Payment"), for: .normal)
            }, completion: nil)
            
            break
        case 7:
            buildPayment()
            saveLbl.text = "Save new card"
            UIView.transition(with: sender as! UIView, duration: 1.0, options: .transitionFlipFromRight, animations: {
                self.deliveryBtn.setImage(UIImage(named: "Delivery"), for: .normal)
                self.addressBtn.setImage(UIImage(named: "Address"), for: .normal)
                self.paymentBtn.setImage(UIImage(named: "checkedPayment"), for: .normal)
            }, completion: nil)
            
            break
        default: break
            
        }
    }
    
    func buildDelivery() {
        
        saveAddView.isHidden = true
        
        UIView.transition(with: self.checkoutContainerView, duration: 1.0, options: .transitionFlipFromRight, animations: {
            
            if self.checkoutContainerView != nil {
                self.address?.removeFromParent()
                self.delivery?.removeFromParent()
                self.payment?.removeFromParent()
            }
            self.checkoutContainerView.addSubview(self.delivery!.view)
            self.addChild(self.delivery!)
            
        }, completion: nil)
    }
    
    func buildAddress() {
        
        saveAddView.isHidden = false
        
        UIView.transition(with: self.checkoutContainerView, duration: 1.0, options: .transitionFlipFromRight, animations: {
            
            if self.checkoutContainerView != nil {
                self.address?.removeFromParent()
                self.delivery?.removeFromParent()
                self.payment?.removeFromParent()
            }
            self.checkoutContainerView.addSubview(self.address!.view)
            self.addChild(self.address!)
            
        }, completion: nil)
    }
    
    func buildPayment() {
        
        saveAddView.isHidden = false
        
        UIView.transition(with: self.checkoutContainerView, duration: 1.0, options: .transitionFlipFromRight, animations: {
            
            if self.checkoutContainerView != nil {
                self.address?.removeFromParent()
                self.delivery?.removeFromParent()
                self.payment?.removeFromParent()
            }
            self.checkoutContainerView.addSubview(self.payment!.view)
            self.addChild(self.payment!)
            
        }, completion: nil)
    }
    
}
