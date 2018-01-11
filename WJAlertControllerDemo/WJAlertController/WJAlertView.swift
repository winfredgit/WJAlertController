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
    @IBOutlet weak var messageMHConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerHConstraint: NSLayoutConstraint!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var cancelWConstraint: NSLayoutConstraint!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var actionWConstraint: NSLayoutConstraint!
    @IBOutlet weak var actionMLConstraint: NSLayoutConstraint!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        settingUI()
    }
    
    func settingUI()
    {
        layer.masksToBounds = true
        layer.cornerRadius = 12
    }
    
    func hiddenCancelButton()
    {
        cancelButton.isHidden = true
        actionWConstraint.constant = 222
        actionMLConstraint.constant = -110
    }
    
    func hiddenActionButton()
    {
        actionButton.isHidden = true
        cancelWConstraint.constant = 222
    }
    
}
