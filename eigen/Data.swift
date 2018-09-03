//
//  Data.swift
//  eigen
//
//  Created by 준킴 on 2018. 7. 12..
//  Copyright © 2018년 junebuug. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class Todo: Object{
    @objc dynamic var title=""
    @objc dynamic var done_cnt = 0;
    @objc dynamic var id = UUID().uuidString;
    override static func primaryKey() -> String?{
        return "id"
    }
    
    let days = LinkingObjects(fromType: Day.self, property: "todos")
}


class Day : Object{
    @objc dynamic var date: Date?
    var todos = List<Todo>()
}
