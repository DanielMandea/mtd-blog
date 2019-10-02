//
//  Constants.swift
//  Application
//
//  Created by Daniel Mandea on 24/06/2019.
//

import Foundation

struct Constants {
    
    struct BlogRouts {
        static let publicPath: String = "public"
        static let indexPath: String = "/"
        static let index: String = "index"
        static let books: String = "books"
        static let about: String = "about"
        static let blog: String = "blog"
        static let blogEntry: String = "blog/:name"
    }
    
    struct EditRouts {
        static let posts: String = "posts"
    }
    
    struct Markdown {
        static let index = "docs"
        static let any = "docs/*"
    }
    
    struct HealthRouts {
        static let health: String = "health"
    }
    
    struct Error {
        static let invalidResponse = NSError(domain: "MTD", code: 2, userInfo: ["error":"Invalid response"])
        static let unknown = NSError(domain: "MTD", code: 2, userInfo: ["error":"Unknown"])
    }
}
