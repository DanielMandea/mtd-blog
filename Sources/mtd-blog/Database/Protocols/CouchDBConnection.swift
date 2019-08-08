//
//  CouchDBConnection.swift
//  Application
//
//  Created by Daniel Mandea on 22/05/2019.
//

import Foundation
import CouchDB

public protocol CouchDBConnection {
    func create(completion: @escaping (Result<Database, Error>) -> ())
}
