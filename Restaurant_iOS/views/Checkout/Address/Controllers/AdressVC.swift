//
//  AdressVC.swift
//  Restaurant_iOS
//
//  Created by azab on 10/14/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class AdressVC: UIViewController {
    
    @IBOutlet weak var addressView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addressView.layer.cornerRadius = 10
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
