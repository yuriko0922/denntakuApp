//
//  ViewController.swift
//  denntakuApp
//
//  Created by 津國　由莉子 on 2019/08/14.
//  Copyright © 2019 yurityann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 結果表示ラベル
    @IBOutlet weak var kekkaLabel: UILabel!
    
    // 定義系を書きます
    // 画面に表示されている文字
    var nowNumber: Double = 0
    // さっきまで表示されてた文字
    var beforNum: Double = 0
    // 計算してOKかの精査
    var okNum = false
    // 数入力されたかの精査
    var putNum = false
    // 記号たち
    var kigou = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 数字のボタンを押した時
    // 数字ボタン紐ずけ
    @IBAction func numberBottun(_ sender: UIButton) {
        if okNum == true{
            // ラベルに押したボタンを表示させる処理
            kekkaLabel.text = String(sender.tag)
            // 表示された数字代入
            nowNumber = Double(kekkaLabel.text!)!
            okNum = false
        } else {
            // 今表示されている数字に押した数字を追加する
            kekkaLabel.text = kekkaLabel.text! + String(sender.tag)
            // 表示されている数字を代入する
            nowNumber = Double(kekkaLabel.text!)!
        }
    }
    
    
    // 記号系ボタン紐ずけ（＋ - ＊ ／）
    @IBAction func kigouBottun(_ sender: UIButton) {
        if kekkaLabel.text != "" {
            // beforNumに表示されている数字を代入
            beforNum = Double(kekkaLabel.text!)!
            // ラベルに記号たち表示（””にある記号ね）タグナンバーで呼ぶ
            if sender.tag == 12{
                kekkaLabel.text = "÷"
            } else if sender.tag == 13 {
                kekkaLabel.text = "×";
            } else if sender.tag == 14 {
                kekkaLabel.text = "-";
            } else if sender.tag == 15 {
                kekkaLabel.text = "＋"
            }
            // kigouにタグ番号代入
            kigou = sender.tag
            // 計算できます
            okNum = true
        }
    }
    
    // クリアボタン紐ずけ
    @IBAction func clearButton(_ sender: UIButton) {
        //クリアボタン押した時の処理
        //ラベルに表示されてたの消す、リセット
        kekkaLabel.text = ""
        nowNumber = 0
        kigou = 0
    }
    
    // = ボタン紐ずけ
    @IBAction func equalButton(_ sender: UIButton) {
        // ＝ボタン押した時の処理
        // ÷ の処理
        if kigou == 12 {
            // 小数点以下が０の時０を消す処理
            let seisuu = String(beforNum / nowNumber).components(separatedBy: ".")
            if seisuu.count > 1 && seisuu[1] == "0" {
                kekkaLabel.text = seisuu[0]
                // 小数の時の処理
            } else {
                kekkaLabel.text = String(beforNum / nowNumber)
            }
            // × の処理
        } else if kigou == 13 {
            // 小数点以下が０の時０を消す処理
            let seisuu = String(beforNum * nowNumber).components(separatedBy: ".")
            if seisuu[1] == "0" {
                kekkaLabel.text = seisuu[0]
            } else {
                // 少数の時の処理
                kekkaLabel.text = String(beforNum * nowNumber)
            }
            // - の処理
        } else if kigou == 14 {
            // 小数点以下が０の時０を消す処理
            let seisuu = String(beforNum - nowNumber).components(separatedBy: ".")
            if seisuu[1] == "0" {
                kekkaLabel.text = seisuu[0]
                // 小数の時の処理
            } else {
                kekkaLabel.text = String(beforNum - nowNumber)
            }
        } else if kigou == 15 {
            // ＋　の処理
            // 小数点以下が０の時０を消す処理
            let seisuu = String(beforNum + nowNumber).components(separatedBy: ".")
            if seisuu[1] == "0" {
                kekkaLabel.text = seisuu[0]
                // 小数の時の処理
            } else {
                kekkaLabel.text = String(beforNum + nowNumber)
            }
        }
    }
}

