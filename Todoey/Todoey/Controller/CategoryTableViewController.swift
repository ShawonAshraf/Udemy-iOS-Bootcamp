//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Shawon Ashraf on 10/29/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    // MARK: - Data vars
    var categories: [Category] = []
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load data from context
        loadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
    }

    // MARK: - Data manipulation
    
    func saveData() {
        do {
            try context.save()
        } catch {
            print("\(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadData(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categories = try context.fetch(request)
        } catch {
            print("\(error)")
        }
        
        self.tableView.reloadData()
    }
    
    
    // MARK: - Action handler
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (_) in
            if let text = textField.text {
                let newCategory = Category(context: self.context)
                newCategory.name = text
                
                self.categories.append(newCategory)
                self.saveData()
            } else {
                // GG
            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}
