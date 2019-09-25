//
//  ChLoader.swift
//  ARC
//
//  Created by Pawan Kumar on 25/09/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import Foundation


public class ChLoader{


    public func ButtonLoader(Button : UIButton,LoaderColour : UIColor,show: Bool){
        let tag = 808404
        if show {
            Button.isEnabled = false
            Button.alpha = 1
            let indicator = UIActivityIndicatorView()
            indicator.color = LoaderColour
            let buttonHeight = Button.bounds.size.height
            let buttonWidth = Button.bounds.size.width
            indicator.center = CGPoint(x: buttonWidth/2, y: buttonHeight/2)
            indicator.tag = tag
            Button.addSubview(indicator)
            indicator.startAnimating()
        } else {
            Button.isEnabled = true
            Button.alpha = 1.0
            if let indicator = Button.viewWithTag(tag) as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }

    


}
