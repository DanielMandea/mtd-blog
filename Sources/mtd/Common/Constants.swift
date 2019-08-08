//
//  Utils.swift
//  Application
//
//  Created by Daniel Mandea on 22/05/2019.
//

import Foundation

struct Constants {
    
    struct DbConfiguration {
        static let devConfiguration: String = "dev-db-configuration.json"
        static let prodConfiguration: String = "prod-db-configuration.json"
        static let dbName: String = "mtd-blog-db"
    }
    
    struct Errors {
        static let dbCreateError: Error = NSError(domain: "MTD", code: 2, userInfo: ["error":"Invalid DB"])
    }
    
    struct Fetch {
        static let invalidResponse = NSError(domain: "MTD", code: 2, userInfo: ["error":"Invalid response"])
    }
    
}

