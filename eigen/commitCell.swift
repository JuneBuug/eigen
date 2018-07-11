//
//  commitCell.swift
//  eigen
//
//  Created by 준킴 on 2018. 7. 12..
//  Copyright © 2018년 junebuug. All rights reserved.
//

import UIKit

class commitCell: UICollectionViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var emoji: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let numberToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        numberToolbar.barStyle = .default
        numberToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneButtonAction))]
        numberToolbar.sizeToFit()
        emoji.inputAccessoryView = numberToolbar
    }

    
    @objc func doneButtonAction(){
        checkMaxLength(textField:emoji, maxLength: 1)
        self.emoji.resignFirstResponder()
    }
    
    
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
        if ((textField.text!.characters.count) > maxLength) {
            textField.deleteBackward()
        }
    }
}
