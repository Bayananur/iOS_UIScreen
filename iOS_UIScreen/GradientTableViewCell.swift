//
//  GradientTableViewCell.swift
//  iOS_UIScreen
//
//  Created by Bauyrzhan Seidazymov on 16.09.2023.
//

import UIKit

class GradientTableViewCell: UITableViewCell {
    let gradientLayer = CAGradientLayer()
    let cellImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        // Add your image view to the cell's content view
   contentView.addSubview(cellImageView)
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        // Configure the gradient layer
        gradientLayer.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0.49).cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor]
        gradientLayer.locations = [0.0, 1.0]
        
        // Add the gradient layer as a sublayer to the image view
        cellImageView.layer.addSublayer(gradientLayer)
    }
}
