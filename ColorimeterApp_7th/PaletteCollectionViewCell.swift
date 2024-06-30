//
//  PaletteCollectionViewCell.swift
//  ColorimeterApp_7th
//
//  Created by Yerkezhan Zheneessova on 20.05.2024.
//

import UIKit

class PaletteCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "PaletteCollectionViewCell"
    @IBOutlet weak var colorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupView(colorPalette: ColorPalette){
        colorView.backgroundColor = colorPalette.getColors(hexColors: colorPalette.hexColors).first
        
    }
    
    

}
