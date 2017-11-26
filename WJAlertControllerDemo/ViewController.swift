//
//  ViewController.swift
//  WJAlertView
//
//  Created by 王炜俊 on 2017/11/25.
//  Copyright © 2017年 winfred. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    fileprivate func showAlertController() {
        let alertController = UIAlertController(title: "提示提示提示提示提示提示提示提示提示提示提示",
                                                message: "修改的内容还未保存，确定退出吗？",
                                                preferredStyle: .alert)
        let exitAction = UIAlertAction(title: "退出",
                                       style: .cancel,
                                       handler: nil)
        let editAction = UIAlertAction(title: "继续编辑",
                                       style: .default,
                                       handler: nil)
        let tempAction = UIAlertAction(title: "测试",
                                       style: .default,
                                       handler: nil)
        alertController.addAction(editAction)
        alertController.addAction(exitAction)
        alertController.addAction(tempAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func touchTest(_ sender: UIButton)
    {
//        showAlertController()
        let alertController = WJAlertController(title: "提醒", message: "修改的内容还未保存，确定退出吗？")
        let exitAction = WJAlertAction(title: "我知道了",
                                       style: .cancel,
                                       handler: {
                                        (action) in
                                        print("touch exit...")
        })
        alertController.addAction(exitAction)
        let editAction = WJAlertAction(title: "继续编辑",
                                       style: .default,
                                       handler: {
                                        (action) in
                                        print("touch edit...")
        })
//        alertController.addAction(editAction)
        self.present(alertController, animated: false, completion: nil)
    }
    
}

