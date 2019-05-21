//
//  NetworkManager.swift
//  User
//
//  Created by V G on 13.05.19.
//  Copyright © 2019 V G. All rights reserved.
//

import Foundation

class NetworkManager {
    
    private let postHttpMethod = "POST"
    private let url = "https://bnet.i-partner.ru/testAPI/"
    private let session = URLSession.shared
    
    let token: String
    
    init(token: String) {
        self.token = token
    }
    
    func createNewSession(onSuccess: @escaping (Session) -> (), onError: @escaping (Error) -> ()) {
        let request = createRequest(urlEndPoint: "new_session", body: nil)
        
        let dataTask = session.dataTask(with: request) { (data, response, error) -> Void in
            if (error != nil) {
                onError(error!)
            } else {
                if let d = data {
                    self.parseResponse(data: d, onSuccess: onSuccess, onError: onError)
                }
            }
        }
        
        dataTask.resume()
    }
    
    func getEntries(sessionId: String, onSuccess: @escaping (EntrySet) -> (), onError: @escaping (Error) -> ()) {
        let request = createRequest(urlEndPoint: "get_entries", body: "session=\(sessionId)")
        
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                onError(error!)
            } else {
                if let d = data {
                    self.parseResponse(data: d, onSuccess: onSuccess, onError: onError)
                }
            }
        })
        
        dataTask.resume()
    }
    
    func addEntry(body: String, sessionId: String, onSuccess: @escaping (NewEntry) -> (), onError: @escaping (Error) -> ()) {
        let request = createRequest(urlEndPoint: "add_entry", body: "body=\(body)&session=\(sessionId)")

        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                onError(error!)
            } else {
                if let d = data {
                    self.parseResponse(data: d, onSuccess: onSuccess, onError: onError)
                }
            }
        })
        
        dataTask.resume()
    }
    
    private func parseResponse<T: PayloadProtocol>(data: Data, onSuccess: @escaping (T) -> (), onError: @escaping (Error) -> ()) {
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(T.self, from: data)
            onSuccess(decoded)
        } catch let e {
            onError(e)
        }
    }
    
    private func createRequest(urlEndPoint: String, body: String?) -> URLRequest {
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = postHttpMethod
        request.allHTTPHeaderFields = getAuthHeaders()
        request.httpBody = getPayloadData(urlEndPoint: urlEndPoint, body: body)
        
        return request as URLRequest
    }
    
    private func getAuthHeaders() -> [String: String] {
        return ["token": token]
    }
    
    private func getPayloadData(urlEndPoint: String, body: String?) -> Data {
        let postData = NSMutableData(data: "a=\(urlEndPoint)".data(using: String.Encoding.utf8)!)
        if body != nil {
            postData.append("&\(body!)".data(using: String.Encoding.utf8)!)
        }
        return postData as Data
    }
    
}
