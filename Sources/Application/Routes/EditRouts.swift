//
//  EditRouts.swift
//  Application
//
//  Created by Daniel Mandea on 04/09/2019.
//

import Foundation
import Kitura
import LoggerAPI
import KituraStencil
import Configuration
import CouchDB
import MTDBlogComponents
import KituraContracts

public class EditRouts {
    
    // MARK: Internal
    
    var router: Router
    var database: Database!
    
    // MARK: - Init
    
    public init(router: Router) {
        self.router = router  
    }
    
    // MARK: - Routs
    
    func getBlogPosts(completion: @escaping ([BlogPostDocument]?, RequestError?) -> Void) {
        database.fetch(with: completion)
    }
    
    func addBlogPost(entry: BlogPostDocument, completion: @escaping (BlogPostDocument?, RequestError?) -> Void) {
        database.append(entry: entry, with: completion)
    }
}

// MARK: - RoutsCompose

extension EditRouts: RoutsCompose {
    
    public func coposeRouts(with database: Database?) {
        self.database = database
        router.post(Constants.EditRouts.post, handler: addBlogPost)
        router.get(Constants.EditRouts.posts, handler: getBlogPosts)
    }
}
