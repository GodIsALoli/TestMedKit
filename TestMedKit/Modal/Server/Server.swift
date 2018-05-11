//
//  Server.swift
//  TestMedKit
//
//  Created by Student on 2018-05-03.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

class Server {
    let serverIP: String
    let serverPort: Int
    let rootURL = "MyCCMB"
    let httpProtocol = "http"
    let conf = URLSessionConfiguration.default
    let session: URLSession
    var sessionID: String!
    
    init(serverIP: String, serverPort: Int) {
        self.serverIP = serverIP
        self.serverPort = serverPort
        conf.allowsCellularAccess = true
        conf.waitsForConnectivity = true
        session = URLSession(configuration: conf)
    }
    
    var base: String {
        get {
            return "\(httpProtocol)://\(serverIP):\(serverPort)/\(rootURL)"
        }
    }
    
    func asyncAuthenticate(endpoint: String, userID: String, password: String, responseHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let loginString = "\(userID):\(password)"
        let loginBase64 = loginString.data(using: .utf8)!.base64EncodedString()
        let loginURL = URL(string: "\(base)/\(endpoint)")!
        
        var loginRequest = URLRequest(url: loginURL)
        loginRequest.addValue("Basic \(loginBase64)", forHTTPHeaderField: "Authorization")
        
        session.dataTask(with: loginRequest, completionHandler: responseHandler).resume()
    }
}
