//
//  ViewController.swift
//  Calculator
//
//  Created by Stephen Ouyang on 11/18/20.
//  Copyright © 2020 Stephen Ouyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let internalView: UIView
    
    init(with view: UIView) {
        internalView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = internalView
        view.frame = UIScreen.main.bounds
    }
    
    required init?(coder: NSCoder) {
        internalView = UIView()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
}

