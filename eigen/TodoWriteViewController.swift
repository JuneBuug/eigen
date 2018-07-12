//
//  TodoWriteViewController.swift
//  eigen
//
//  Created by 준킴 on 2018. 7. 12..
//  Copyright © 2018년 junebuug. All rights reserved.
//

import UIKit
import RealmSwift
class TodoWriteViewController: UIViewController {

    @IBOutlet weak var text: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickAdd(_ sender: Any) {
        let todo = Todo()
        todo.title = text.text ?? ""
        
        // Get the default Realm
        let realm = try! Realm()
        // You only need to do this once (per thread)
        
        // Add to the Realm inside a transaction
        try! realm.write {
            realm.add(todo)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
