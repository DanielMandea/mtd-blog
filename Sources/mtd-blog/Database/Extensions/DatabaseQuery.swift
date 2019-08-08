//
//  DatabaseQuery.swift
//  mtd
//
//  Created by Daniel Mandea on 30/06/2019.
//

import Foundation
import CouchDB

extension Database {
    
    func fetch<T: Codable>(with complition: @escaping (Result<T, Error>) -> Void)  {
        retrieveAll(includeDocuments: true) { (data, error) in
            guard let data = data,
                let encodedRows = try? JSONSerialization.data(withJSONObject: data.rows),
                let values = try? JSONDecoder().decode(T.self, from: encodedRows) else { complition(.failure(Constants.Fetch.invalidResponse)); return }
            complition(.success(values))
        }
    }
    
}
