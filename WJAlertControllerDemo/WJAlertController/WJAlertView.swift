//
//  WJAlertView.swift
//  WJAlertControllerDemo
//
//  Created by 王炜俊 on 2017/11/25.
//  Copyright © 2017年 winfred. All rights reserved.
//

import UIKit

class WJAlertView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel?
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerHConstraint: NSLayoutConstraint!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var cancelWConstraint: NSLayoutConstraint!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var actionWConstraint: NSLayoutConstraint!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        settingUI()
    }
    
    func settingUI()
    {
        layer.masksToBounds = true
        layer.cornerRadius = 6
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = UIColor(red: 102/255.0,
                                                 green: 187/255.0,
                                                 blue: 71/255.0,
                                                 alpha: 1).cgColor
        cancelButton.layer.cornerRadius = 4
        actionButton.layer.cornerRadius = 4
    }
    
    func hiddenCancelButton()
    {
        cancelButton.isHidden = true
        actionWConstraint.constant = 230
    }
    
    func hiddenActionButton()
    {
        actionButton.isHidden = true
        cancelWConstraint.constant = 230
    }
    
}
