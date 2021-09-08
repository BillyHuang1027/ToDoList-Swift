//
//  ListTableViewController.swift
//  ToDoList-Swift
//
//  Created by 金融研發一部-黃昌齊 on 2021/9/6.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var items = [
        Items(name: "Coffee with Facebook Engineer", topic: "Information Interview"),
        Items(name: "Phone interview with Snap", topic: "2nd Interview"),
        Items(name: "Update README for Capstone project", topic: "Github")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
    }
    
    func configureNavBar() {
        let image = UIImage(systemName: "plus")
        let plusButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(addItem))
        self.navigationItem.rightBarButtonItem = plusButton
        self.navigationItem.title = "To do list"
    }
    
    @objc func addItem() {
        let alertController = UIAlertController(title: "Add a new to do list item.", message: "", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Enter the name of item."
        }
        alertController.addTextField { textField in
            textField.placeholder = "Enter the topic."
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            let name = alertController.textFields?[0].text
            let topic = alertController.textFields?[1].text
            let newItem = Items(name: name ?? "", topic: topic ?? "")
            self.items.append(newItem)
            
            let indexPath = IndexPath(row: self.items.count - 1, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewControllerCell", for: indexPath)
        let item = self.items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.topic

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
