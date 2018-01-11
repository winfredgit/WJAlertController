//
//  WJAlertAction.swift
//  WJAlertControllerDemo
//
//  Created by 王炜俊 on 2017/11/26.
//  Copyright © 2017年 winfred. All rights reserved.
//

import UIKit

enum WJAlertActionStyle: Int {
    case cancel
    case `default`
}

class WJAlertAction: NSObject {
    var title: String
    var style: Int
    var handler: ((WJAlertAction) -> Void)?
    
    init(title: String, style: Int, handler: ((WJAlertAction) -> Void)?)
    {
        self.title = title
        self.style = style
        self.handler = handler
    }

}
