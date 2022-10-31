//
//  UIColorExtension.swift
//  RandomColors
//
//  Created by roberts.kursitis on 27/10/2022.
//

import UIKit

extension UIColor {
    static func randomize() -> UIColor {
        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1)
        return randomColor
    }
    
    var inverted: UIColor {
            var r: CGFloat = 0.0,
                g: CGFloat = 0.0,
                b: CGFloat = 0.0,
                a: CGFloat = 0.0

            self.getRed(&r, green: &g, blue: &b, alpha: &a)
            return UIColor(red: (1 - r), green: (1 - g), blue: (1 - b), alpha: a)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return NSString(format:"#%06x", rgb) as String
    }

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
}
