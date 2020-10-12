//
//  CartTVCell.swift
//  Restaurant_iOS
//
//  Created by azab on 10/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class CartTVCell: UITableViewCell {

    @IBOutlet weak var addLbl: UILabel!
    @IBOutlet weak var BGCellView: UIView!
    @IBOutlet weak var gradientView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addLbl.layer.cornerRadius = 10
        BGCellView.layer.cornerRadius = 10
        
        let gradientView = Gradient(frame: self.gradientView.bounds)
        gradientView.isOpaque = false
        gradientView.alpha = CGFloat(0.9)
        self.gradientView.insertSubview(gradientView, at: 0)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
