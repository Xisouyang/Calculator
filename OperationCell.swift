//
//  OperationCell.swift
//  Calculator
//
//  Created by Stephen Ouyang on 11/18/20.
//  Copyright © 2020 Stephen Ouyang. All rights reserved.
//

import UIKit

class OperationCell: UICollectionViewCell {
    
    private var operationLabel: UILabel
    
    override init(frame: CGRect) {
        operationLabel = UILabel()
        super.init(frame: frame)
        build()
    }
    
    private func build() {
        contentView.backgroundColor = .systemYellow
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.addSubview(operationLabel)
        operationLabel.translatesAutoresizingMaskIntoConstraints = false
        operationLabel.font = UIFont.boldSystemFont(ofSize: 32)
        NSLayoutConstraint.activate([
            operationLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            operationLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            operationLabel.widthAnchor.constraint(equalToConstant: 40),
            operationLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configure(with text: String) {
        operationLabel.text = text
        operationLabel.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
