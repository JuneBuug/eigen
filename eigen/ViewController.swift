//
//  ViewController.swift
//  eigen
//
//  Created by 준킴 on 2018. 7. 12..
//  Copyright © 2018년 junebuug. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class ViewController: UIViewController{

    var titles = ["요가하기","양파요리하기","개발하기"]
    var emojis = ["","","","🙂","","✅","✨"]
    
    @IBOutlet weak var todoTable: UITableView!
    var todos : Results<Todo>!
    var headerHeight : CGFloat = 212.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTable.delegate = self
        todoTable.dataSource = self
//        todoTable.isEditing = true
        let nibName = UINib(nibName: "todoCellTableViewCell", bundle: nil)
        let nibCell = UINib(nibName: "commitCell", bundle: nil)
        let realm = try! Realm()
        todos = realm.objects(Todo.self)
        todoTable.register(nibName, forCellReuseIdentifier: "todoCellTableViewCell")
     
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onAdd(_ sender: Any) {
    }
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if todos.count <= 0{
            return 3
        }else{
            return todos.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCellTableViewCell", for: indexPath) as! todoCellTableViewCell
        
        if todos.count <= 0{
            cell.title.text = titles[indexPath.row]
        }else{
            cell.title.text = todos[indexPath.row].title
            
            let done_cnt = todos[indexPath.row].done_cnt
            if done_cnt > 1 {
                cell.times.text = "have done " + String(done_cnt) + " times."
            }else if done_cnt == 1 {
                cell.times.text = "have done " + String(done_cnt) + " time."
            }else{
                cell.times.text = "Go Get This CHANCE!"
            }
        }
        cell.doneBtn.tag = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if todos.count <= 0{
            let movedObject = self.titles[sourceIndexPath.row]
            titles.remove(at: sourceIndexPath.row)
            titles.insert(movedObject, at: destinationIndexPath.row)
        }else{
//         Realm 삭제해야함
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return commitCollection.instanceFromNib()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220.0
    }
}

