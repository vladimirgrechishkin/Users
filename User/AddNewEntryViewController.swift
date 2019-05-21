//
//  AddNewEntryViewController.swift
//  User
//
//  Created by V G on 13.05.19.
//  Copyright © 2019 V G. All rights reserved.
//

import UIKit

class AddNewEntryViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    private let nm = NetworkManager(token: "cRStQ3u-Oo-XLAH708")
    
    var sessionId: String?
    
    @IBAction func acceptTapped(_ sender: UIButton) {
        if let id = sessionId {
            performNetworkFlow {
                if let inputText = textView.text {
                    nm.addEntry(body: inputText, sessionId: id, onSuccess: { [unowned self] (entry)  in
                        if entry.error == nil {
                            DispatchQueue.main.async {
                                self.showAlert(title: "Success", message: "Entry created")
                            }
                        } else {
                            DispatchQueue.main.async {
                                self.showAlert(title: "Failure", message: entry.error!)
                            }
                        }
                    }) { (error) in
                        DispatchQueue.main.async {
                            self.showAlert(title: "Failure", message: "Problem in entry creation")
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
