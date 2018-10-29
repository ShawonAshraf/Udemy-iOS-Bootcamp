//
//  Category.swift
//  Todoey
//
//  Created by Shawon Ashraf on 10/29/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    
    let todos = List<Todo>()
}
