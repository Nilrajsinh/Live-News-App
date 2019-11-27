//
//  Main View.swift
//  Live News
//
//  Created by Nilrajsinh Vaghela on 27/11/19.
//  Copyright © 2019 Nilrajsinh Vaghela. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class Main_View: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var TableView: UITableView!
    
    var post = [String]()
    var ref:DatabaseReference?
    var databaseHandel:DatabaseHandle?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = post.reversed()[indexPath.row]

        return cell
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        TableView.delegate = self
        TableView.dataSource = self

        
        ref = Database.database().reference()
             
           databaseHandel = ref?.child("Demo").observe(.childAdded, with: { (snapshot) in
        
             let pdata = snapshot.value as? String
             if let actualpost = pdata{
             
             self.post.append(actualpost)
                 
                self.TableView.reloadData()
             }
             })
        
        // Do any additional setup after loading the view.
    }
    

    

}
