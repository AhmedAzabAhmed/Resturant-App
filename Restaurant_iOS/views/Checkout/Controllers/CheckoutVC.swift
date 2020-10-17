//
//  CheckoutVC.swift
//  Restaurant_iOS
//
//  Created by azab on 10/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class CheckoutVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var checkoutScrollView: UIScrollView!
    
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
        
        checkoutScrollView.delegate = self
        
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
        case 18:
             self.showToast(message: "Request Done", font: .systemFont(ofSize: 15.0))
//             self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
             
             if let tabbar = (storyboard!.instantiateViewController(withIdentifier: "tabbar") as?
                 UITabBarController) {
                 tabbar.modalPresentationStyle = .fullScreen
                 self.present(tabbar, animated: true, completion: nil)
             }

            break
        default: break
            
        }
    }
    
    func buildDelivery() {
        
        saveAddView.isHidden = true
        navigationItem.title = "Checkout"
        
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
        navigationItem.title = "Address"
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
        navigationItem.title = "Payment"
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
