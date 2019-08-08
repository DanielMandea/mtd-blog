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
    
    struct HealthRouts {
        static let health: String = "health"
    }
}
