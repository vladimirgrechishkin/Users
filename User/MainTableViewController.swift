//
//  MainTableViewController.swift
//  User
//
//  Created by V G on 13.05.19.
//  Copyright © 2019 V G. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nm = NetworkManager(token: "cRStQ3u-Oo-XLAH708")
        nm.createNewSession(onSuccess: { (session) in
            print(session.status)
            print(session.data.session)
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "#FFFFFFF"
        return cell
    }


}

