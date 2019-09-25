//
//  ChAnimation.swift
//  ARC
//
//  Created by Pawan Kumar on 25/09/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import Foundation


public class ChAnimation {
    
    //MARK: - shakeAnimationForAnyView
    public func ShakeAnimationForAnyView(viewSend : UIView) {
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.08
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: viewSend.center.x - 6, y: viewSend.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: viewSend.center.x + 6, y: viewSend.center.y))
        viewSend.layer.add(animation, forKey: "position")
        
    }
    
}
