//
//  ChTextField.swift
//  ARC
//
//  Created by Pawan Kumar on 25/09/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//


import Foundation


public class ChTextField{
    
    //MARK: - TextfiledAnimation
   public func TextFieldPlaceHolderColorChange(textField : UITextField,color : UIColor)  {
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color])
        
    }
   public func TextFieldIsValidEmail(TextFieldString:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: TextFieldString)
    }
    
    
    public func TextFieldIsValidPassword(TextFieldString : String , MinimumDigit : Int , CapitalAlphabet : Bool , Number : Bool , SpecialCharacter : Bool) -> String {
        
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalresult = texttest.evaluate(with: TextFieldString)
        //print(capitalresult)
        
        let numberRegEx  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberresult = texttest1.evaluate(with: TextFieldString)
        // print("\(numberresult)")
        
        let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        let specialresult = texttest2.evaluate(with: TextFieldString)
        //print("\(specialresult)")
        
        
        var ReturnString = ""
        if TextFieldString == ""{
            ReturnString = "Please Enter Password"
        }
        else if TextFieldString.count < MinimumDigit{
            ReturnString = "Password length should be greater than \(String(MinimumDigit)) letter."
        }
        else if capitalresult == false{
            ReturnString = "Password should contain capital letter."
        }
        else if numberresult == false{
            ReturnString = "Password should contain capital number."
        }
        else if specialresult == false{
            ReturnString = "Password should contain capital special character."
        }
        else{
            ReturnString = "Success"
        }
        
        return ReturnString
    }
    
}
