//
//  BlogPostDocument.swift
//  Application
//
//  Created by Daniel Mandea on 05/09/2019.
//

import Foundation
import CouchDB
import MTDBlogComponents

class BlogPostDocument: BlogPost, Document {
    var _id: String?
    var _rev: String?
}
