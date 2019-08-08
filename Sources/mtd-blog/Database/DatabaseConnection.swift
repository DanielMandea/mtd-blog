//
//  DbConfiguration.swift
//  Application
//
//  Created by Daniel Mandea on 22/05/2019.
//

import Foundation
import CouchDB
import FileKit

struct DatabaseConnection {
    
    static var connectionProprieties: ConnectionProperties? {
        var prop: ConnectionProperties?
        switch Configuration.environment {
        case .dev:
            prop = properties(for: Constants.DbConfiguration.devConfiguration)
        case .production:
            prop = properties(for: Constants.DbConfiguration.prodConfiguration)
        }
        return prop
    }
    
    static func properties(for ressource: String) -> ConnectionProperties? {
        let url = URL(fileURLWithPath: "\(FileKit.projectFolder)/Configuration/\(ressource)")
        guard let data = try? Data(contentsOf: url),
            let dev = try? JSONDecoder().decode( DatabaseConfiguration.self, from: data)
            else { return nil }
        return ConnectionProperties(configuration: dev)
    }
}
