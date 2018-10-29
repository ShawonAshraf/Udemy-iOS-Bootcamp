//
//  TodoeyVCExtension.swift
//  Todoey
//
//  Created by Shawon Ashraf on 10/19/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//

import UIKit

extension TodoListViewController: UISearchBarDelegate {
    // search bar delegates
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        todos = todos?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadData()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}
