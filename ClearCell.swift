//
//  ClearCell.swift
//  Calculator
//
//  Created by Stephen Ouyang on 11/18/20.
//  Copyright © 2020 Stephen Ouyang. All rights reserved.
//

import UIKit

class ClearCell: UICollectionViewCell {
    
    private var clearLabel: UILabel
    
    override init(frame: CGRect) {
        clearLabel = UILabel()
        super.init(frame: frame)
        build()
    }
    
    private func build() {
        contentView.backgroundColor = .systemRed
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.addSubview(clearLabel)
        clearLabel.translatesAutoresizingMaskIntoConstraints = false
        clearLabel.font = UIFont.boldSystemFont(ofSize: 32)
        NSLayoutConstraint.activate([
            clearLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            clearLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            clearLabel.widthAnchor.constraint(equalToConstant: 40),
            clearLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configure(with text: String) {
        clearLabel.text = text
        clearLabel.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
