//
//  TodoeyVCExtension.swift
//  Todoey
//
//  Created by Shawon Ashraf on 10/19/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//

import UIKit
import CoreData

extension TodoListViewController: UISearchBarDelegate {
    // search bar delegates
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        
        request.predicate = predicate
        
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        // fetch
        loadData(with: request)
    }
}
