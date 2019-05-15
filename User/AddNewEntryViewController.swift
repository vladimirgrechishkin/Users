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
    
    @IBAction func acceptTapped(_ sender: UIButton) {
        print("accept")
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
