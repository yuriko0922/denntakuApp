//
//  ViewController.swift
//  denntakuApp
//
//  Created by 津國　由莉子 on 2019/08/14.
//  Copyright © 2019 yurityann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //結果表示ラベル
    @IBOutlet weak var kekkaLabel: UILabel!
    
    //定義系を書きます
    //画面に表示されている文字
    var nowNumber: Double = 0;
    //さっきまで表示されてた文字
    var beforNum: Double = 0;
    //計算してOKかの精査
    var okNum = false
    //数入力されたかの精査
    var putNum = false
    //記号たち
    var kigou = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //数字のボタンを押した時
    //数字ボタン紐ずけ
    @IBAction func numberBottun(_ sender: UIButton) {
        if okNum == true{
            kekkaLabel.text = String(sender.tag-1)
            nowNumber = Double(kekkaLabel.text!)!
            okNum = false
        } else {
            kekkaLabel.text = kekkaLabel.text! + String(sender.tag)
            nowNumber = Double(kekkaLabel.text!)!
        }
        
    }
    
    
    //記号系ボタン紐ずけ
    @IBAction func kigouBottun(_ sender: UIButton) {
        
        
        
        
        
    }
    
}

