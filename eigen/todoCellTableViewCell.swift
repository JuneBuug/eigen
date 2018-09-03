//
//  todoCellTableViewCell.swift
//  eigen
//
//  Created by 준킴 on 2018. 7. 12..
//  Copyright © 2018년 junebuug. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class todoCellTableViewCell: UITableViewCell {

    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var bg: UIView!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var times: UILabel!
    var todos:Results<Todo>!
    let realm = try! Realm()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor.clear
        
        self.background.layer.borderWidth = 1
        self.background.layer.cornerRadius = 8
        self.background.layer.borderColor = UIColor.clear.cgColor
        self.background.layer.masksToBounds = true
        
        self.bg.layer.shadowOpacity = 0.05
        self.bg.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.bg.layer.shadowRadius = 8
        self.bg.layer.shadowColor = UIColor.black.cgColor
        self.bg.layer.masksToBounds = false
        
        todos = realm.objects(Todo.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    @objc func connected(_ sender: UIButton) {
//        let tag = sender.tag
//        print(tag)
////        var todo = todos[tag]
////        try! realm.write {
////            todo.done_cnt += 1
////        }
//
//    }
    
    @IBAction func onTouchDone(_ sender: UIButton) {
        print(sender.tag)
        var todo = todos[tag]
        try! realm.write {
            todo.done_cnt += 1
        }
    
        if todo.done_cnt  > 1 {
            self.times.text = "have done " + String(todo.done_cnt) + " times."
        }else if todo.done_cnt  == 1 {
            self.times.text = "have done " + String(todo.done_cnt) + " time."
        }else{
            self.times.text = "Go Get This CHANCE!"
        }
    }
    
}
