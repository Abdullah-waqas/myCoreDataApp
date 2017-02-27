//
//  customUITextField.swift
//  7-days
//
//  Created by Abdullah on 20/01/2017.
//  Copyright © 2017 Abdullah. All rights reserved.
//

import UIKit
@IBDesignable
class customUITextField: UITextField {
    @IBInspectable var leftImage: UIImage?{
        didSet {
            updateview()
        }
    }
    @IBInspectable var leftPadding: Int = 0{
        didSet {
            updateview()
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    func updateview() {
        if leftImage != nil{
            leftViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 18))
            imageView.image = leftImage
            var width = leftPadding + 18
            if borderStyle == UITextBorderStyle.none || borderStyle == UITextBorderStyle.line{
                width = width + 5
            }
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 18))
            view.addSubview(imageView)
            leftView = view
            
        }else {
            leftViewMode = .never
        }
        
    }
    
}
