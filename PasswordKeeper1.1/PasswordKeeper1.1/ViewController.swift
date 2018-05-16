//
//  ViewController.swift
//  PasswordKeeper1.1
//
//  Created by Van Anh on 5/15/18.
//  Copyright © 2018 Van Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var items: [ItemMO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
}

extension ViewController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(items.count)
        return items.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200.0;//Choose your custom row height
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCell
        let item = items[indexPath.row]
        
        cell.nameapp?.text = item.nameapp
        cell.username?.text = item.username
        cell.password?.text = item.password
        
        
        return cell
    }

}

