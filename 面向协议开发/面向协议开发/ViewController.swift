//
//  ViewController.swift
//  面向协议开发
//
//  Created by joewang on 2018/10/31.
//  Copyright © 2018 joewang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstView = FirstView.loadFromNib()
        firstView.name = "LXF"
        view.addSubview(firstView)
        
        let secondView = SecondView.loadFromNib()
        secondView.age = 100
        view.addSubview(secondView)
        
    }


}

