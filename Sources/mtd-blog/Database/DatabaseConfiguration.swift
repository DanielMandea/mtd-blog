//
//  DatabaseConfiguration.swift
//  Application
//
//  Created by Daniel Mandea on 22/05/2019.
//

import Foundation

struct DatabaseConfiguration: Codable {
    
    var host: String
    var port: Int
    var secured: Bool
    var username: String?
    var password: String?
    
    enum CodingKeys: String, CodingKey {
        case host, port, secured, username, password
    }
}
