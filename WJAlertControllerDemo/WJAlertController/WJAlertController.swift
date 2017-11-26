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
    var actions: [WJAlertAction]
    var cancelAction: WJAlertAction?
    var cancelHandler: ((WJAlertAction) -> Void)?
    var actionAction: WJAlertAction?
    var actionHandler: ((WJAlertAction) -> Void)?
    
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
        let size = message.boundingRect(with: CGSize(width: 182, height: 0),
                                        options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                        attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13)],
                                        context: nil).size
        if size.height > alertView.messageHConstraint.constant {
            alertView.messageHConstraint.constant = size.height
        }
        let height = 50 + alertView.messageHConstraint.constant + 20 + 40 + 14
        alertView.frame = CGRect(x: 0, y: 0, width: 252, height: height)
        alertView.center = CGPoint(x: screenFrame.width/2, y: screenFrame.height/2)
        alertView.titleLabel.text = alertTitle
        alertView.messageLabel.text = message
        alertView.cancelButton.addTarget(self, action: #selector(touchCancel), for: .touchUpInside)
        alertView.actionButton.addTarget(self, action: #selector(touchAction), for: .touchUpInside)
        for action in actions {
            if action.style == WJAlertActionStyle.cancel {
                alertView.cancelButton.setTitle(action.title, for: .normal)
                cancelAction = action
                cancelHandler = action.handler
            } else {
                alertView.actionButton.setTitle(action.title, for: .normal)
                actionAction = action
                actionHandler = action.handler
            }
        }
        if cancelHandler == nil {
            alertView.hiddenCancelButton()
        }
        if actionHandler == nil {
            alertView.hiddenActionButton()
        }
        self.view.addSubview(alertView)
    }
    
    // MARK: -
    func addAction(_ action: WJAlertAction)
    {
        actions.append(action)
    }
    
    @objc func touchCancel()
    {
        cancelHandler!(cancelAction!)
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func touchAction()
    {
        actionHandler!(actionAction!)
        self.dismiss(animated: false, completion: nil)
    }
    
}
