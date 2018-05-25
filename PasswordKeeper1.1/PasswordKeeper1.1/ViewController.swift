//
//  ViewController.swift
//  PasswordKeeper1.1
//
//  Created by Van Anh on 5/15/18.
//  Copyright © 2018 Van Anh. All rights reserved.
//

import UIKit

import CoreData

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var items = [ItemMO]()

    override func viewDidLoad() {
        super.viewDidLoad()

        items = ItemMO.getAllItem()
        
        tableView.reloadData()

    }
    
    @IBAction func onPlusTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Account", message: nil, preferredStyle: .alert)
        
        alert.addTextField{(textField) in
            textField.placeholder = "Name Application"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "User name"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Password"
        }
        
        let addAction = UIAlertAction(title: "Post", style: .default) { (_) in
            let nameApp = alert.textFields!.first!.text!
            let username = alert.textFields![1].text!
            let password = alert.textFields!.last!.text!
            
            if let item1 = ItemMO.insertNewItem(id: 1, nameapp: nameApp, username: username , password: password){
                self.items.append(item1)
                self.tableView.reloadData()
            }
        }
        
        alert.addAction(addAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
}

extension ViewController:UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = items[indexPath.row]
            
            let title = "Delete your account with name \(item.username ?? "")"
            
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action)->Void in
                self.items.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            
            ac.addAction(deleteAction)
            
            present(ac, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if (indexPath.row >= items.count){
            return false
        } else {
            return true
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(items.count)
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCell
        let item = items[indexPath.row]
        cell.nameapp?.text = item.nameapp
        cell.username?.text = item.username
        cell.password?.text = item.password
        cell.icon.image = UIImage(data: item.icon! as Data)
        return cell
    }
}


