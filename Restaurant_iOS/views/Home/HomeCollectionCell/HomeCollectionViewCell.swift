//
//  HomeCollectionViewCell.swift
//  Restaurant_iOS
//
//  Created by azab on 9/19/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBGView: UIView!
    
    @IBOutlet weak var restLogo: UIImageView!
    
    @IBOutlet weak var restName: UILabel!
    @IBOutlet weak var restHotline: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        prepareCollectionCellView()
        restLogo.layer.cornerRadius = 20
    }
    
    func prepareCollectionCellView() {
        
        cellBGView.layer.cornerRadius = 25
        
        cellBGView.layer.shadowColor = UIColor.black.cgColor
        cellBGView.layer.shadowOpacity = 0.01
        cellBGView.layer.shadowOffset = .zero
        
        cellBGView.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        cellBGView.layer.shadowPath = UIBezierPath(rect: cellBGView.bounds).cgPath
        cellBGView.layer.shouldRasterize = true
        cellBGView.layer.rasterizationScale = UIScreen.main.scale
        cellBGView.layer.shadowRadius = 25
    }
}
