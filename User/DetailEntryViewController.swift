//
//  DetailEntryViewController.swift
//  User
//
//  Created by V G on 18.05.19.
//  Copyright © 2019 V G. All rights reserved.
//

import UIKit

class DetailEntryViewController: UIViewController {
    
    var idLabelText: String?
    var dateAddedLabelText: String?
    var dateModifiedLabelText: String?
    var dataLabelText: String?
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var dateAddedLabel: UILabel!
    @IBOutlet weak var dateModifiedLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        idLabel.text = "ID: " + (idLabelText ?? "")
        dateAddedLabel.text = "Date added: " + (dateAddedLabelText ?? "")
        dateModifiedLabel.text = "Date modified: " + (dateModifiedLabelText ?? "")
        dataLabel.text = "Text: " + (dataLabelText ?? "")
    }
    
}
