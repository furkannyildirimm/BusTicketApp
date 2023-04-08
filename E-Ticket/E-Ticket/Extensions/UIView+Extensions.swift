//
//  UIView+Extensions.swift
//  E-Ticket
//
//  Created by STARK on 1.04.2023.
//

import UIKit


extension UIView {
     
   @IBInspectable var cornerRadius: CGFloat{
       get{return self.cornerRadius}
       set{
            self.layer.cornerRadius = newValue
        }
       
    }
}

