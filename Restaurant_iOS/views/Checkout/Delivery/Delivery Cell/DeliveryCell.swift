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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        deliveryCellView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
