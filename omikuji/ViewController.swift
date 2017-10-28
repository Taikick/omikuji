//
//  ViewController.swift
//  omikuji
//
//  Created by 加藤　大起 on 2017/10/29.
//  Copyright © 2017年 Taiki Kato. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myImageView: UIImageView!
    
    var omikuji = ["大吉","吉","中吉","小吉","末吉","凶","大凶"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //占いボタンが押された時発動
    @IBAction func myButton(_ sender: UIButton) {
        
        //占いの結果をランダムに選ぶための数字を作成
        //(7で割ってるので余りが0から6しか出てこない)
        let r = Int(arc4random()) % omikuji.count
        
        print("今日の占い:\(omikuji[r])")
        
        //TODO:おみくじ結果をアラートで表示しましょう
        //TODO:アラートにOKボタンを付けて、OKが押されたら、おみくじ結果に紐付いた画像を画面に表示するようにしてください。
        //TODO:出来上がったらGithubにPushして提出
        
        
        //部品となるアラートを作成
        let alert = UIAlertController(title: "おみくじ結果", message: "\(omikuji[r])です", preferredStyle: .alert)
        
        //アラートにOKボタンを追加
        //handler : OKボタンが押された時に行いたい処理を指定する場所
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print(self.omikuji[r])}))
        
        //アラートを表示する処理
        //completion : 動作が完了した後に発動するメソッド
        //animated :
        present(alert, animated: true, completion: { action in self.setImage(newImage: UIImage(named:"\(r).jpg")!) })
        
        
    }
    public func setImage(newImage: UIImage) {
        DispatchQueue.main.async {
            self.myImageView.image = newImage
            self.myImageView.setNeedsLayout()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
