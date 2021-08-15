//
//  Helper.swift
//  KeepTruckinAssignment
//
//  Created by Deepakraj Murugesan on 15/08/21.
//

import Foundation
import  UIKit

let SCREENWIDTH = CGFloat(UIScreen.main.bounds.width)
let IS_IPAD = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad
let SCALE_FACTOR: CGFloat = IS_IPAD ? 1.6 : 1

class Helper{
    class func getAttributedText(text: String, color: String, alignment: NSTextAlignment, font: UIFont) -> NSAttributedString{
        let text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let textColor = Helper.hexString(color)
        
        let textAlignment = NSMutableParagraphStyle()
        textAlignment.alignment = alignment
        
        return NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.font: font, NSAttributedString.Key.paragraphStyle: textAlignment])
    }
    
    class func getTextHeight(string: NSAttributedString?, width: CGFloat) -> CGFloat{
        let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
        if let string = string{
            if string.length > 0{
                let size = (string.boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude), options: options, context: nil))
                return (size.height)
            }
        }
        return 0
    }
    
    class func getTextWidth(string: NSAttributedString?, width: CGFloat) -> CGFloat{
        let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
        if let string = string{
            if string.length > 0{
                let size = (string.boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude), options: options, context: nil))
                return (size.width)
            }
        }
        return 0
    }
    
    class func hexString(_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}


extension Collection {
  subscript(safe index: Index) -> Iterator.Element? {
    guard indices.contains(index) else { return nil }
    return self[index]
  }
}


extension UIFont{
    class func setupFont(_ size: CGFloat) -> UIFont{
        let fontSize = size * SCALE_FACTOR
        return UIFont.systemFont(ofSize: fontSize)
    }
}
