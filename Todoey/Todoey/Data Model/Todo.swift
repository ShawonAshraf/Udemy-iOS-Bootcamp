//
//  Todo.swift
//  Todoey
//
//  Created by Shawon Ashraf on 10/29/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//

import Foundation
import RealmSwift

class Todo: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "todos")
}
