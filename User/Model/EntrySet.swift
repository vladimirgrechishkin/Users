//
//  EntrySet.swift
//  User
//
//  Created by V G on 13.05.19.
//  Copyright © 2019 V G. All rights reserved.
//

import Foundation

struct EntrySet: PayloadProtocol {
    
    let status: Int
    let error: String?
    let data: [[Payload]]?
    
    struct Payload: Codable {
        let id: String
        let body: String
        let da: String
        let dm: String
    }
    
}
