//
//  DefaultDatabaseConnection.swift
//  Application
//
//  Created by Daniel Mandea on 29/05/2019.
//

import Foundation
import CouchDB

class DefaultCouchDBConnection {
    
    // MARK: - Internal
    
    var dbName: String
    var client: CouchDBClient
    
    init(dbName: String = Constants.DbConfiguration.dbName, properties: ConnectionProperties) {
        self.dbName = dbName
        client = CouchDBClient(connectionProperties: properties)
    }
}

// MARK: - CouchDBConnection

extension DefaultCouchDBConnection: CouchDBConnection {
    
    func create(completion: @escaping (Result<Database, Error>) -> ()) {
        client.retrieveDB(Constants.DbConfiguration.dbName, callback: { [weak self] (database, error) in
            guard let `self` = self else { return }
            guard let database = database, error == nil else {
                self.client.createDB(self.dbName, callback: { (database, error) in
                    guard let database = database, error == nil else {
                        completion(.failure(error ?? Constants.Errors.dbCreateError))
                        return
                    }
                    completion(.success(database))
                })
                return
            }
            completion(.success(database))
         })
    }
}
