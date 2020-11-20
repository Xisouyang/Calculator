//
//  CalculatorView.swift
//  Calculator
//
//  Created by Stephen Ouyang on 11/18/20.
//  Copyright © 2020 Stephen Ouyang. All rights reserved.
//

import UIKit

enum CellType {
    case number, operation, clear
}

protocol CalcCollectionCellProtocol {
    
}

class CalculatorView: UIView {
    
    var collectionView: UICollectionView
    var textField: UITextField
    let symbolsDict: [Int: String] = [
                                      0: "1", 1: "2", 2: "3", 3: "+", 4: "4",
                                      5: "5", 6: "6", 7: "-", 8: "7", 9: "8",
                                      10: "9", 11: "x", 12: "C", 13: "0",
                                      14: "=", 15: "÷"
                                     ]
    
    init() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
               textField = UITextField(frame: .zero)
        super.init(frame: .zero)
        build()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func build() {
        addSubview(textField)
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        textField.addLeftSidePadding(amount: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.description())
        collectionView.register(NumberCell.self, forCellWithReuseIdentifier: NumberCell.description())
        collectionView.register(OperationCell.self, forCellWithReuseIdentifier: OperationCell.description())
        collectionView.register(ClearCell.self, forCellWithReuseIdentifier: ClearCell.description())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        NSLayoutConstraint.activate([
            
            textField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            textField.centerXAnchor.constraint(equalTo: centerXAnchor),
            textField.heightAnchor.constraint(equalToConstant: 70),
            textField.widthAnchor.constraint(equalTo: widthAnchor, constant: -32),
            
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            collectionView.topAnchor.constraint(equalTo: textField.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            collectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 1.5)
        ])
    }
}

extension CalculatorView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}

extension CalculatorView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0, 1, 2, 4, 5, 6, 8, 9, 10, 13:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.description(), for: indexPath) as! NumberCell
            if let symbol = symbolsDict[indexPath.item] {
                cell.configure(with: symbol)
            }
            return cell
        case 3, 7, 11, 14, 15:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OperationCell.description(), for: indexPath) as! OperationCell
            if let symbol = symbolsDict[indexPath.item] {
                cell.configure(with: symbol)
            }
            return cell
        case 12:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClearCell.description(), for: indexPath) as! ClearCell
            if let symbol = symbolsDict[indexPath.row] {
                cell.configure(with: symbol)
            }
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.description(), for: indexPath)
            return cell
        }
    }
}

extension UITextField {
    func addLeftSidePadding(amount: CGFloat) {
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.height))
        leftViewMode = .always
    }
}

extension UICollectionViewCell: CalcCollectionCellProtocol {
    
}
