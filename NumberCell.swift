//
//  NumberCell.swift
//  Calculator
//
//  Created by Stephen Ouyang on 11/18/20.
//  Copyright © 2020 Stephen Ouyang. All rights reserved.
//

import UIKit

class NumberCell: UICollectionViewCell {
    
    private var numberLabel: UILabel
    
    override init(frame: CGRect) {
        numberLabel = UILabel()
        super.init(frame: frame)
        build()
    }
    
    private func build() {
        contentView.backgroundColor = .lightGray
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.addSubview(numberLabel)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.font = UIFont.boldSystemFont(ofSize: 32)
        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            numberLabel.widthAnchor.constraint(equalToConstant: 40),
            numberLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configure(with text: String) {
        numberLabel.text = text
        numberLabel.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
