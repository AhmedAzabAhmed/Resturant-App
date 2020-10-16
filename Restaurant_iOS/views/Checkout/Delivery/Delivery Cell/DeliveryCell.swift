//
//  TableViewCell.swift
//  Restaurant_iOS
//
//  Created by azab on 10/14/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class DeliveryCell: UITableViewCell {

    @IBOutlet weak var deliveryCellView: UIView!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var orderDetailsLbl: UILabel!
    
    @IBOutlet weak var radioBtn: UIButton!
    
    var checked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        deliveryCellView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func check(_ sender: Any) {
        if checked {
                radioBtn.setImage(UIImage(named: "RadioButton"), for: .normal)
            checked = false
        } else {
            radioBtn.setImage(UIImage(named: "checkedRadioButton"), for: .normal)
            checked = true
        }
        
    }
    
}
