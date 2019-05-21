//
//  Session.swift
//  User
//
//  Created by V G on 13.05.19.
//  Copyright © 2019 V G. All rights reserved.
//

import Foundation

struct Session: PayloadProtocol {
    
    let status: Int
    let error: String?
    let data: Payload?
        
    struct Payload: Codable {
        let session: String
    }

}
