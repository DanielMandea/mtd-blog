//
//  DefaultRoutesConnection.swift
//  Application
//
//  Created by Daniel Mandea on 29/05/2019.
//

import Foundation
import CouchDB
import Kitura
import Health
import Application 

struct DefaultRoutesConnection {
    
    // MARK: - Internal
    
    var routes: [RoutsCompose]
    
    // MARK: - Init 
    
    init(routes: [RoutsCompose]) {
        self.routes = routes
    }
}

// MARK: - RoutesConnection

extension DefaultRoutesConnection: RoutsConnection {
    func connectRouts(for database: Database?) {
        for route in  routes { route.coposeRouts(with: database) }
    }
}
