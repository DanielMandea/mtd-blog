//
//  Configuration.swift
//  Application
//
//  Created by Daniel Mandea on 22/05/2019.
//

import Foundation
import CouchDB

struct Configuration {
    static var environment: Environment {
//        #if os(macOS)
        return .dev
//        #elseif os(Linux)
//        return .production
//        #endif
    }
}
