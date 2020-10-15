//
//  BrandCollectionViewCell.swift
//  Restaurant_iOS
//
//  Created by azab on 9/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class BrandCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var brandImg: UIImageView!
    
    @IBOutlet weak var brandLoc: UILabel!
    
    @IBOutlet weak var brandHotline: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
