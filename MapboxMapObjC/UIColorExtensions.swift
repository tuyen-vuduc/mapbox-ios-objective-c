import Foundation
import UIKit

enum UIColorFromStringError : Error {
    case invalidPrefix(prefix: String)
}

extension UIColor {
    class func fromString(string: String) -> UIColor {
        if (string.hasPrefix("rgb")) {
            return rgb(string: string)
        } else if (string.hasPrefix("rgba")) {
            return rgba(string: string)
        } else if (string.hasPrefix("hsl")) {
            return hsl(string: string)
        } else if (string.hasPrefix("hsla")) {
            return hsla(string: string)
        }
        return UIColor.clear
    }
    
    
    class func rgb(string: String) -> UIColor {
        var values:[Double] = fromWellKnownString(string: string, prefix: "rgb")
        
        let red:Double = (values[0] / 255.0)
        let green:Double = (values[1] / 255.0)
        let blue:Double = (values[2] / 255.0)
        
        // instantiate the colour and return it (performing casts of the Doubles to CGFloats as required)
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
    class func rgba(string: String) -> UIColor {
        var values:[Double] = fromWellKnownString(string: string, prefix: "rgba")
        
        let red:Double = (values[0] / 255.0)
        let green:Double = (values[1] / 255.0)
        let blue:Double = (values[2] / 255.0)
        let alpha:Double = values[3]
        
        // instantiate the colour and return it (performing casts of the Doubles to CGFloats as required)
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
    // A factory method to take an rgb colour string ("rgb(255,255,255)") and return a UIColor object.
    class func hsl(string: String) -> UIColor {
        var values:[Double] = fromWellKnownString(string: string, prefix: "hsl")
        
        let hue:Double = (values[0] / 360.0)
        let saturation:Double = (values[1] / 100.0)
        let brightness:Double = (values[2] / 100.0)
        
        // instantiate the colour and return it (performing casts of the Doubles to CGFloats as required)
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    // A factory method to take an rgb colour string ("rgb(255,255,255)") and return a UIColor object.
    class func hsla(string: String) -> UIColor {
        var values:[Double] = fromWellKnownString(string: string, prefix: "hsla")
        
        // divide values by 255 before setting their placeholder variables up...
        let hue:Double = (values[0] / 360.0)
        let saturation:Double = (values[1] / 100.0)
        let brightness:Double = (values[2] / 100.0)
        let alpha:Double = values[3]
        
        // instantiate the colour and return it (performing casts of the Doubles to CGFloats as required)
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
    // A factory method to take an rgb colour string ("rgb(255,255,255)") and return a UIColor object.
    private class func fromWellKnownString(string: String, prefix: String) -> [Double] {
        guard string.hasPrefix(prefix) else {
            return [0,0,0,0];
        }
        
        // create mutable copy...
        var rgbString = string
        
        // remove potential spaces...
        rgbString = rgbString.replacingOccurrences(of: " ", with: "")

        // get rid of prefix e.g. 'rgb('...
        rgbString = rgbString.replacingOccurrences(of: "\(prefix)(", with: "")
        
        // get rid of trailing bracket...
        rgbString = rgbString.replacingOccurrences(of: ")", with: "")
        
        // split up the rgb values seperated by strings....
        let split = rgbString.components(separatedBy: ",")
        
        return split.map{
            return Double($0)!
        }
    }
}
