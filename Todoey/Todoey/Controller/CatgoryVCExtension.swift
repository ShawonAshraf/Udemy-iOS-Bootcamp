//
//  CatgoryVCExtension.swift
//  Todoey
//
//  Created by Shawon Ashraf on 10/31/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//

import UIKit
import SwipeCellKit
import RealmSwift

extension CategoryTableViewController: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            if let categoryToBeDeleted = self.categories?[indexPath.row] {
                do {
                    try self.realm?.write {
                        self.realm?.delete(categoryToBeDeleted)
                    }
                } catch {
                    // GG
                }
                
//                self.tableView.reloadData()
            }
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
//        options.transitionStyle = .border
        return options
    }
}
