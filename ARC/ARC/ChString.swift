//
//  ChString.swift
//  ARC
//
//  Created by Pawan Kumar on 25/09/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import Foundation

public class ChString{

   public func StringConvertIntoPhoneNumberFormat(PhoneNUmberString: String , Format : String) -> String {
        let cleanPhoneNumber = PhoneNUmberString.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = Format
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }

    public func StringContailSingleEmoji(InputString : String) -> Bool{
        let ReturnString = InputString.isSingleEmoji
        return ReturnString
    }
    
    public func StringContailEmojiOrNot(InputString : String) -> Bool{
        let StringContainEmojiOrNot = InputString.containsEmoji
        return StringContainEmojiOrNot
    }
    
    public func StringContailOnlyEmoji(InputString : String) -> Bool{
           let OnlyEmogji = InputString.containsOnlyEmoji
           return OnlyEmogji
    }

    public func StringAllEmojiExtract(InputString : String) -> [String] {
        let AllEmojiGot = InputString.emojis
        let CreateArary : [String] = AllEmojiGot
        return CreateArary
    }
 
    public func StringAllEmojiCodeExtract(InputString : String) -> [UnicodeScalar] {
        let EmohiScale = InputString.emojiScalars
        let CreateArary : [UnicodeScalar] = EmohiScale
        return CreateArary
        
    }
    
    public func StringStartingWhiteSpaceRemove(InputString:String) ->String{
        let trimmed = InputString.replacingOccurrences(of: "^\\s+|", with: "", options: .regularExpression)
        return trimmed
    }
    
    public func StringEndingWhiteSpaceRemove(InputString:String) ->String{
        let trimmed = InputString.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
        return trimmed
    }
    
   public func StringMultipleLineWhiteSpaceRemove(InputString:String) ->String{
        do{
            
            let regex = try NSRegularExpression(pattern: "\\n+", options:[.dotMatchesLineSeparators])
            let resultString = regex.stringByReplacingMatches(in: InputString, range: NSMakeRange(0, InputString.utf16.count), withTemplate: "\n")
            
            return resultString.replacingOccurrences(of: "  ", with: "").trimmingCharacters(in: .whitespacesAndNewlines)
        }
        catch{
            return ""
        }
    }
    
   public func StringHaveCharacter(InputString:String) -> Bool{

        let REmoveWhiteSpace = self.StringMultipleLineWhiteSpaceRemove(InputString: InputString)
        if REmoveWhiteSpace.count == 0{
            return false
        }
        else{
            return true
        }
    }
 
}




extension String {
    // Not needed anymore in swift 4.2 and later, using `.count` will give you the correct result
    var glyphCount: Int {
        let richText = NSAttributedString(string: self)
        let line = CTLineCreateWithAttributedString(richText)
        return CTLineGetGlyphCount(line)
    }
    
    var isSingleEmoji: Bool {
        return glyphCount == 1 && containsEmoji
    }
    
    var containsEmoji: Bool {
        return unicodeScalars.contains { $0.isEmoji }
    }
    
    var containsOnlyEmoji: Bool {
        return !isEmpty
            && !unicodeScalars.contains(where: {
                !$0.isEmoji && !$0.isZeroWidthJoiner
            })
    }
    
    // The next tricks are mostly to demonstrate how tricky it can be to determine emoji's
    // If anyone has suggestions how to improve this, please let me know
    var emojiString: String {
        return emojiScalars.map { String($0) }.reduce("", +)
    }
    
    var emojis: [String] {
        var scalars: [[UnicodeScalar]] = []
        var currentScalarSet: [UnicodeScalar] = []
        var previousScalar: UnicodeScalar?
        
        for scalar in emojiScalars {
            if let prev = previousScalar, !prev.isZeroWidthJoiner, !scalar.isZeroWidthJoiner {
                scalars.append(currentScalarSet)
                currentScalarSet = []
            }
            currentScalarSet.append(scalar)
            
            previousScalar = scalar
        }
        
        scalars.append(currentScalarSet)
        
        return scalars.map { $0.map { String($0) }.reduce("", +) }
    }
    
    fileprivate var emojiScalars: [UnicodeScalar] {
        var chars: [UnicodeScalar] = []
        var previous: UnicodeScalar?
        for cur in unicodeScalars {
            if let previous = previous, previous.isZeroWidthJoiner, cur.isEmoji {
                chars.append(previous)
                chars.append(cur)
                
            } else if cur.isEmoji {
                chars.append(cur)
            }
            
            previous = cur
        }
        
        return chars
    }
}


extension UnicodeScalar {
    /// Note: This method is part of Swift 5, so you can omit this.
    /// See: https://developer.apple.com/documentation/swift/unicode/scalar
    var isEmoji: Bool {
        switch value {
        case 0x1F600...0x1F64F, // Emoticons
        0x1F300...0x1F5FF, // Misc Symbols and Pictographs
        0x1F680...0x1F6FF, // Transport and Map
        0x1F1E6...0x1F1FF, // Regional country flags
        0x2600...0x26FF, // Misc symbols
        0x2700...0x27BF, // Dingbats
        0xE0020...0xE007F, // Tags
        0xFE00...0xFE0F, // Variation Selectors
        0x1F900...0x1F9FF, // Supplemental Symbols and Pictographs
        0x1F018...0x1F270, // Various asian characters
        0x238C...0x2454, // Misc items
        0x20D0...0x20FF: // Combining Diacritical Marks for Symbols
            return true
            
        default: return false
        }
    }
    
    var isZeroWidthJoiner: Bool {
        return value == 8205
    }
}
