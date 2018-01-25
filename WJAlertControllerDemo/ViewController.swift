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
//        let alertController = WJAlertController(title: "提醒",
//                                                message: "阿三开多久啊阿三开啊阿三开啊阿三开")
        let customView = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        customView.backgroundColor = UIColor.white
        let alertController = WJAlertController(title: "提示",
                                                customView: customView)
//        let exitAction = WJAlertAction(title: "取消",
//                                       style: 0,
//                                       handler: {
//                                        (action) in
//                                        print("touch exit...")
//        })
//        alertController.addAction(exitAction)
        let cancelAction = WJAlertAction(title: "取消",
                                         style: 0,
                                         handler: {
                                            (action) in
                                            print("touch cancel...")
        })
        alertController.addAction(cancelAction)
        let serviceAction = WJAlertAction(title: "去认证",
                                          style: 1,
                                          handler: {
                                            (action) in
                                            print("touch service...")
        })
        alertController.addAction(serviceAction)
        self.present(alertController, animated: false, completion: nil)
    }
    
}

