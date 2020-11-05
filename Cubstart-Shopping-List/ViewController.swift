//
//  ViewController.swift
//  Cubstart-Shopping-List
//
//  Created by Alex Lu on 10/11/20.
//  Copyright © 2020 Alexandra Lu. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell{
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemCount: UILabel!
}

// Make sure to connect DataSource and Delegate
class ViewController : UIViewController, UITableViewDataSource{
    
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Arrays and Variables
    let items = [("Apple", 4, "apple.jpeg"), ("Orange", 10, "orange.jpg"), ("Banana", 3, "banana.jpg")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Register your table view
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCell")
    }
    
    // UITableViewDataSource functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell
        cell.itemName.text = items[indexPath.row].0
        cell.itemCount.text = "Count: \(items[indexPath.row].1)"
        cell.itemImage.image = UIImage(named: items[indexPath.row].2)
       return cell
    }
    
    // UITableViewDelegate function
    func tableView( tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "item", sender: self)
    }
    
    // Preparing your segue
//Un Comment this block of code - it has an error
//    func prepare(for segue: UIStoryboardSegue, sender: any?)  {
//        if segue.identifier == "item" {
//                        var vc: ItemViewController = segue.destination as! ItemViewController
//                }
//    }
}


