//
//  PaymentVC.swift
//  Restaurant_iOS
//
//  Created by azab on 10/14/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class PaymentVC: UIViewController {

    let datePicker = UIDatePicker()
    
    @IBOutlet weak var paymentView: UIView!
    
    @IBOutlet weak var epireDateField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showDatePicker()

        epireDateField.inputView = datePicker
        
        paymentView.layer.cornerRadius = 10
    }
       
    
    func showDatePicker(){
           //Formate Date
           datePicker.datePickerMode = .date
           
           //ToolBar
           let toolbar = UIToolbar();
           toolbar.sizeToFit()
           let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
           let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
           let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
           
           toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
           
           epireDateField.inputAccessoryView = toolbar
           epireDateField.inputView = datePicker
           
       }
    
    @objc func donedatePicker(){
           
           let formatter = DateFormatter()
           formatter.dateFormat = "dd/MM/yyyy"
           epireDateField.text = formatter.string(from: datePicker.date)
           self.view.endEditing(true)
       }
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
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
