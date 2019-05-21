//
//  Extensions.swift
//  User
//
//  Created by V G on 18.05.19.
//  Copyright © 2019 V G. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func performNetworkFlow(_ function: () -> ()) {
        if Reachability.isConnectedToNetwork() {
            function()
        } else {
            showAlert(title: "Connection problem", message: "Please check your internet connection")
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func dateToString(timestamp: TimeInterval) -> String {
        return Date(timeIntervalSince1970: timestamp).description
    }
    
}

