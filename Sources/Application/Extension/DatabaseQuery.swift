//
//  DatabaseQuery.swift
//  mtd
//
//  Created by Daniel Mandea on 30/06/2019.
//

import Foundation
import Kitura
import CouchDB

extension Database {
    
    func fetch<T: Document>(with completion: @escaping ([T]?, RequestError?) -> Void)  {
        retrieveAll(includeDocuments: true) { (data, error) in
            guard let data = data else {
                let error = RequestError(rawValue: error?.statusCode ?? 2, reason: error?.localizedDescription ?? Constants.Error.unknown.localizedDescription)
                return completion( nil, error)
            }
            completion(data.decodeDocuments(ofType: T.self), nil)
        }
    }
    
    func fetch<T: Document>(with uniqueID: String, completion: @escaping (T?, Error?) -> ()) {
        retrieve(uniqueID, callback: completion)
    }
    
    func append<T: Document>(entry: T, with completion: @escaping (T?, Error?) -> Void) {
        create(entry) {[weak self] (response, error) in
            guard let response = response, response.ok else {
                return completion(nil, error)
            }
            self?.fetch(with: response.id, completion: completion)
        }
    }
    
    func append<T: Document>(entry: T, with completion: @escaping (T?, RequestError?) -> Void) {
        append(entry: entry) { (document, error) in
            guard let document = document, error == nil else {
                let error = RequestError(rawValue: 2, reason: error?.localizedDescription ?? "")
                return completion(nil, error)
            }
            completion(document, nil)
        }
    }
    
    
}
