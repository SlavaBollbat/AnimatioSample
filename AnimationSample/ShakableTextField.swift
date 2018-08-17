//
//  ShakableText.swift
//  AnimationSample
//
//  Created by Слава on 14.08.2018.
//  Copyright © 2018 Слава. All rights reserved.
//

import UIKit


protocol Shakable {
    func shake()
}

extension UITextField: Shakable{
    
    func shake ()
    {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 6, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 6, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
        
    }
    
}



