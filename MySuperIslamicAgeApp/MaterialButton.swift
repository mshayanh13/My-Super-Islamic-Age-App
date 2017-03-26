//
//  MaterialButton.swift
//  MySuperIslamicAgeApp
//
//  Created by Mohammad Hemani on 3/26/17.
//  Copyright © 2017 Mohammad Hemani. All rights reserved.
//

import UIKit

class MaterialButton: UIButton {
    
    let SHADOW_COLOR: CGFloat = 157.0 / 255.0
    
    override func awakeFromNib() {
        
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).cgColor
        layer.shadowOpacity = 0.8 //Little less than fully opaque
        layer.shadowRadius = 5.0 // How much to blur
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0) // offset to right and going down
        
    }
    
}
