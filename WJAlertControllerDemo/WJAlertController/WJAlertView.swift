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
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageHConstraint: NSLayoutConstraint!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var cancelMRConstraint: NSLayoutConstraint!
    @IBOutlet weak var cancelWConstraint: NSLayoutConstraint!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var actionWConstraint: NSLayoutConstraint!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        settingUI()
    }
    
    func settingUI()
    {
        backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
        layer.masksToBounds = true
        layer.cornerRadius = 12
        cancelButton.layer.cornerRadius = 5
        actionButton.layer.cornerRadius = 5
    }
    
    func hiddenCancelButton()
    {
        cancelButton.isHidden = true
        cancelMRConstraint.constant = -100
        actionWConstraint.constant = 210
    }
    
    func hiddenActionButton()
    {
        actionButton.isHidden = true
        cancelMRConstraint.constant = -100
        cancelWConstraint.constant = 210
    }
    
}
