//
//  ViewController.swift
//  eigen
//
//  Created by 준킴 on 2018. 7. 12..
//  Copyright © 2018년 junebuug. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    var titles = ["요가하기","양파요리하기","개발하기"]
    var emojis = ["","","","🙂","","✅","✨"]

    @IBOutlet weak var todoTable: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTable.delegate = self
        todoTable.dataSource = self
//        todoTable.isEditing = true
        collectionView.delegate = self
        collectionView.dataSource = self
        let nibName = UINib(nibName: "todoCellTableViewCell", bundle: nil)
        let nibCell = UINib(nibName: "commitCell", bundle: nil)
        
        todoTable.register(nibName, forCellReuseIdentifier: "todoCellTableViewCell")
        collectionView.register(nibCell, forCellWithReuseIdentifier: "commitCell")
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCellTableViewCell", for: indexPath) as! todoCellTableViewCell
        
        cell.title.text = titles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.titles[sourceIndexPath.row]
        titles.remove(at: sourceIndexPath.row)
        titles.insert(movedObject, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "commitCell", for: indexPath) as! commitCell
        
        cell.emoji.text = emojis[(indexPath.row * 2 ) % 7]
        if indexPath.row % 4 == 0 {
            cell.background.backgroundColor = UIColor(red: 211.0/255.0, green: 214.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        }
        else if indexPath.row % 4 == 1 {
            cell.background.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        }
        else if indexPath.row % 4 == 2 {
            cell.background.backgroundColor = UIColor(red: 148.0/255.0, green: 191.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        }
        else{
            cell.background.backgroundColor = UIColor(red: 100.0/255.0, green: 165.0/255.0, blue: 241.0/255.0, alpha: 1.0)
        }
    
        return cell
    }
    
}
