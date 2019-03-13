//
//  TempViewController.swift
//  WJAlertViewDemo
//
//  Created by 王炜俊 on 2017/11/25.
//  Copyright © 2017年 winfred. All rights reserved.
//

import UIKit

class WJAlertController: UIViewController {
    var alertView: WJAlertView
    
    var alertTitle: String
    var message: String
    var customView: UIView?
    var actions: [WJAlertAction]
    var actionAction: WJAlertAction?
    var actionHandler: ((WJAlertAction) -> Void)?
    var cancelAction: WJAlertAction?
    var cancelHandler: ((WJAlertAction) -> Void)?
    
    init(title: String, message: String)
    {
        alertView = Bundle.main.loadNibNamed("WJAlertView",
                                             owner: nil,
                                             options: nil)![0] as! WJAlertView
        alertTitle = title
        self.message = message
        actions = [WJAlertAction]()
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
    }
    
    init(title: String, customView: UIView)
    {
        alertView = Bundle.main.loadNibNamed("WJCustomAlertView",
                                             owner: nil,
                                             options: nil)![0] as! WJAlertView
        alertTitle = title
        message = ""
        self.customView = customView
        alertView.containerView.addSubview(self.customView!)
        alertView.containerHConstraint.constant = self.customView!.frame.size.height
        actions = [WJAlertAction]()
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(sender:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHidden(sender:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(sender: Notification)
    {
        let info = sender.userInfo!
        let value = info[UIKeyboardFrameBeginUserInfoKey] as! NSValue
        let keyboardSize = value.cgRectValue.size
        alertView.center.y = (UIScreen.main.bounds.size.height - keyboardSize.height) / 2.0
    }
    
    @objc func keyboardWillHidden(sender: Notification)
    {
        alertView.center.y = UIScreen.main.bounds.size.height / 2.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingUI()
    }
    
    func settingUI()
    {
        let screenFrame = UIScreen.main.bounds
        self.view.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
        var height: CGFloat = 0
        let contentMaxHeight = UIScreen.main.bounds.size.height - 103.5 - 24 * 2
        if (customView == nil) {
            var size = message.boundingRect(with: CGSize(width: 204, height: 0),
                                            options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                            attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)],
                                            context: nil).size
            if size.height >= 33 {  // 33大概两行高度，大于1行则居左对齐
                alertView.messageLabel?.textAlignment = NSTextAlignment.left
            }
            size.height += 10   // 计算size有误差，导致不换行，这里追加一点
            alertView.messageMHConstraint.constant = size.height > contentMaxHeight ? contentMaxHeight : size.height
            height = 103.5 + alertView.messageMHConstraint.constant
        } else {
            var frame = customView!.frame
            frame.size.width = 204
            frame.size.height = frame.size.height > contentMaxHeight ? contentMaxHeight : frame.size.height
            customView!.frame = frame
            alertView.containerHConstraint.constant = frame.size.height
            height = 103.5 + alertView.containerHConstraint.constant
        }
        alertView.frame = CGRect(x: 0, y: 0, width: 252, height: height)
        alertView.center = CGPoint(x: screenFrame.width/2.0, y: screenFrame.height/2.0)
        alertView.titleLabel.text = alertTitle
        if (alertView.messageLabel != nil) {
            alertView.messageLabel!.text = message
        }
        updateActionsUI()
        alertView.actionButton.addTarget(self, action: #selector(touchAction), for: .touchUpInside)
        alertView.cancelButton.addTarget(self, action: #selector(touchCancel), for: .touchUpInside)
        self.view.addSubview(alertView)
    }
    
    func updateActionsUI()
    {
        for action in actions {
            if action.style == 0 {
                alertView.cancelButton.setTitle(action.title, for: .normal)
                cancelAction = action
                cancelHandler = action.handler
            } else {
                alertView.actionButton.setTitle(action.title, for: .normal)
                actionAction = action
                actionHandler = action.handler
            }
        }
        if cancelHandler != nil && actionHandler != nil {
            setActionCorner(action: alertView.cancelButton, rectCorner: [UIRectCorner.topLeft, UIRectCorner.bottomLeft])
            setActionCorner(action: alertView.actionButton, rectCorner: [UIRectCorner.topRight, UIRectCorner.bottomRight])
        } else {
            alertView.cancelButton.layer.cornerRadius = 6
            alertView.actionButton.layer.cornerRadius = 6
            if cancelHandler == nil {
                alertView.hiddenCancelButton()
            }
            if actionHandler == nil {
                alertView.hiddenActionButton()
            }
        }
    }
    
    func setActionCorner(action: UIButton, rectCorner: UIRectCorner)
    {
        let path = UIBezierPath(roundedRect: action.bounds,
                                byRoundingCorners: rectCorner,
                                cornerRadii: CGSize(width: 6, height: 6))
        let layer = CAShapeLayer()
        layer.frame = action.bounds
        layer.path = path.cgPath
        action.layer.mask = layer
    }
    
    // MARK: -
    func addAction(_ action: WJAlertAction)
    {
        actions.append(action)
    }
    
    @objc func touchCancel()
    {
        self.dismiss(animated: false) {
            self.cancelHandler!(self.cancelAction!)
        }
    }
    
    @objc func touchAction()
    {
        self.dismiss(animated: false) {
            self.actionHandler!(self.actionAction!)
        }
    }
    
}
