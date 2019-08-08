//
//  ConnectionPropertiesExtension.swift
//  Application
//
//  Created by Daniel Mandea on 22/05/2019.
//

import Foundation
import CouchDB

extension ConnectionProperties {
    
    init(configuration: DatabaseConfiguration) {
        self.init(host: configuration.host, port: UInt16(configuration.port), secured: configuration.secured, username: configuration.username, password: configuration.password)
    }
}
