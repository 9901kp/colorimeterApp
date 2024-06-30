//
//  ColorPalette.swift
//  ColorimeterApp_7th
//
//  Created by Yerkezhan Zheneessova on 20.05.2024.
//

import UIKit

struct ColorPalette{
    
    var id: String
    var name: String
    var hexColors: [String]
    var isFavorite: Bool

    func getColors(hexColors: [String]) -> [UIColor]{
        
        let colors = hexColors.map { UIColor(hex: $0) ?? UIColor.black }
        return colors

    }
}

extension UIColor {
    convenience init?(hex: String) {
        let r, g, b: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: 1.0)
                    return
                }
            }
        }
        
        return nil
    }
}
