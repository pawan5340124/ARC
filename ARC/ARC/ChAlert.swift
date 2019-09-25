//
//  ChAlert.swift
//  ARC
//
//  Created by Pawan Kumar on 25/09/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import Foundation


public class ChAlert{
    
    
    //MARK: - Alert Appear
    public func AlertAppear(Messaage : String, Title : String, View : UIViewController,Button : Bool,SingleButton : Bool,FirstButtonText : String,SecondButtonText : String){
        
        if Button == false{
            //Simple pop up no button have
            let alert = UIAlertController(title: Title, message: Messaage, preferredStyle: .alert)
            View.present(alert, animated: true, completion: nil)
            let when = DispatchTime.now() + 2.5
            DispatchQueue.main.asyncAfter(deadline: when)
            {
                alert.dismiss(animated: true, completion: nil)
            }
        }
        else if SingleButton == true{
            //inly single button appear here
            let alert = UIAlertController.init(title: Title, message: Messaage, preferredStyle: .alert)
            let Ok = UIAlertAction.init(title: FirstButtonText, style: .default) { (sender) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(Ok)
            View.present(alert, animated: true, completion: nil)
            
        }
        else {
            
            let alert = UIAlertController.init(title: Title, message: Messaage, preferredStyle: .alert)
            let Ok = UIAlertAction.init(title: FirstButtonText, style: .default) { (sender) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(Ok)
            let CANCEL = UIAlertAction.init(title: SecondButtonText, style: .default) { (sender) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(CANCEL)
            View.present(alert, animated: true, completion: nil)
        }
    }
    
    
    public func AlertForTextFieldAppear(Message : String,TextField : UITextField){
        TextField.clipsToBounds = false
        TextField.clipsToBounds = false
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let label = UILabel(frame: CGRect(x: 0, y: TextField.layer.frame.height + 2, width: width - 20, height: 21))
        label.textAlignment = .left
        label.textColor = UIColor.red
        label.text = Message
        label.font = label.font.withSize(16)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        TextField.addSubview(label)
        
        let AnimationCall = ChAnimation()
        AnimationCall.ShakeAnimationForAnyView(viewSend: TextField)
        TextField.textColor = UIColor.red
        TextField.attributedPlaceholder = NSAttributedString(string: TextField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            TextField.textColor = UIColor.black
            TextField.attributedPlaceholder = NSAttributedString(string: TextField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            label.isHidden = true
        }
        
    }
    
    
}
