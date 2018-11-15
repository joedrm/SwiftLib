//
//  Nibloadable.swift
//  面向协议开发
//
//  Created by joewang on 2018/10/31.
//  Copyright © 2018 joewang. All rights reserved.
//

import UIKit

protocol Nibloadable {
    
}

extension Nibloadable {
    static func loadFromNib() -> Self {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.first as! Self
    }
}
