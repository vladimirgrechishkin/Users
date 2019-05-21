//
//  PayloadProtocol.swift
//  User
//
//  Created by V G on 13.05.19.
//  Copyright © 2019 V G. All rights reserved.
//

import Foundation

protocol PayloadProtocol: Codable {
    
    associatedtype Payload
    
    var status: Int { get }
    var error: String? { get }
    
}
