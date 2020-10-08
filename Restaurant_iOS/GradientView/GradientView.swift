//
//  GradientView.swift
//  Restaurant_iOS
//
//  Created by azab on 9/2/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit

class GradientView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        autoresizingMask = [.flexibleWidth, .flexibleHeight]

        guard let theLayer = self.layer as? CAGradientLayer else {
            return;
        }

        theLayer.colors = [UIColor(red:45/255, green:45/255, blue:45/255, alpha: 0.0).cgColor, UIColor(red:8/255, green:8/255, blue:8/255, alpha: 0.89).cgColor, UIColor(red:0/255, green:0/255, blue:0/255, alpha: 1.0).cgColor]
//        theLayer.locations = [0.3, 0.4, 0.5]
        theLayer.frame = self.bounds
    }

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
}
