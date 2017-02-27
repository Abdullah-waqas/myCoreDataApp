//
//  customUIButton.swift
//  7-days
//
//  Created by Abdullah on 20/01/2017.
//  Copyright © 2017 Abdullah. All rights reserved.
//

import UIKit

@IBDesignable
class customUIButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
}
