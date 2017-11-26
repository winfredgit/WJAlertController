//
//  WJAlertAction.swift
//  WJAlertControllerDemo
//
//  Created by 王炜俊 on 2017/11/26.
//  Copyright © 2017年 winfred. All rights reserved.
//

import UIKit

enum WJAlertActionStyle: Int {
    case `default`
    case cancel
}

class WJAlertAction: NSObject {
    var title: String
    var style: WJAlertActionStyle
    var handler: ((WJAlertAction) -> Void)?
    
    init(title: String, style: WJAlertActionStyle, handler: ((WJAlertAction) -> Void)?)
    {
        self.title = title
        self.style = style
        self.handler = handler
    }

}
