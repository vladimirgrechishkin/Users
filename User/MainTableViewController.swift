//
//  MainTableViewController.swift
//  User
//
//  Created by V G on 13.05.19.
//  Copyright © 2019 V G. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var entrySet: EntrySet?
    var sessionId: String?
    
    private let nm = NetworkManager(token: "cRStQ3u-Oo-XLAH708")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performNetworkFlow {
            self.nm.createNewSession(onSuccess: { [unowned self] (session) in
                if session.error == nil {
                    self.sessionId = session.data?.session
                } else {
                    DispatchQueue.main.async {
                        self.showAlert(title: "Failure", message: session.error!)
                    }
                }
            }) { (error) in
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let id = sessionId {
            pullSessionData(sessionId: id)
        }
    }
    
    private func pullSessionData(sessionId: String) {
        performNetworkFlow {
            nm.getEntries(sessionId: sessionId, onSuccess: { [unowned self] (entrySet) in
                
                if entrySet.error == nil {
                    
                    self.entrySet = entrySet
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } else {
                    DispatchQueue.main.async {
                        self.showAlert(title: "Failure", message: entrySet.error!)
                    }
                }
             
            }, onError: { (error) in
                print(error.localizedDescription)
            })
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entrySet?.data?[0].count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let entryData = entrySet?.data?[0][indexPath.row] {
            
            let dm = dateToString(timestamp: TimeInterval(entryData.dm)!)
            let da = dateToString(timestamp: TimeInterval(entryData.da)!)
            
            cell.textLabel?.numberOfLines = 0
            
            cell.textLabel?.text = String(entryData.body.prefix(200)) + "\n" + "Date added: \(da.description)"
            
            if da != dm {
                cell.textLabel!.text! += "\n" + "Date modified: \(dm.description)"
            }
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let entryData = entrySet?.data?[0][indexPath.row] {
            let detailEntryVC = storyboard?.instantiateViewController(withIdentifier: "DetailEntryViewController") as! DetailEntryViewController
            detailEntryVC.idLabelText = entryData.id
            detailEntryVC.dataLabelText = entryData.body
            detailEntryVC.dateAddedLabelText = dateToString(timestamp: TimeInterval(entryData.da)!)
            detailEntryVC.dateModifiedLabelText = dateToString(timestamp: TimeInterval(entryData.dm)!)
            navigationController?.pushViewController(detailEntryVC, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addNewEntryVC = segue.destination as? AddNewEntryViewController {
            addNewEntryVC.sessionId = self.sessionId
        }
    }

}

