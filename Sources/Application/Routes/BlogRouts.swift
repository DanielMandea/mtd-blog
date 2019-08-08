//
//  Blog.swift
//  Application
//
//  Created by Daniel Mandea on 10/05/2019.
//

import Foundation
import Kitura
import LoggerAPI
import KituraStencil
import Configuration
import CouchDB

public class BlogRouts {
    
    // MARK: Internal 
    
    var router: Router
    var database: Database!
    
    // MARK: - Init
    
    public init(router: Router) {
        self.router = router
    }
    
    // MARK: - Routs 
    
    func blog(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) {
        let url = URL(fileURLWithPath: ConfigurationManager.BasePath.pwd.path + "/posts.json")
        let data = try! Data(contentsOf: url)
        let blogPosts = try! JSONDecoder().decode(Array<BlogPost>.self, from: data)
        do { try response.render(Constants.BlogRouts.blog, with: blogPosts, forKey: "posts") } catch { Log.debug(error.localizedDescription) }
        next()
    }
    
    func blogEntry(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) {
        let url = URL(fileURLWithPath: ConfigurationManager.BasePath.pwd.path + "/posts.json")
        let data = try! Data(contentsOf: url)
        let blogPosts = try! JSONDecoder().decode(Array<BlogPost>.self, from: data)
        
        let name = request.parameters["name"]!
        guard !name.hasSuffix(".html") else {
            /*
             Forward requests for 'post.html' to 'post'.
             This code is included to remain backwards compatible with existing links that include the extension.
             */
            let extensionIndex = name.index(name.endIndex, offsetBy: -5)
            let trimmedName = name[..<extensionIndex]
            do { try response.redirect("/blog/\(trimmedName)", status: .movedPermanently) } catch { Log.debug(error.localizedDescription) }
            return next()
        }
        guard let post = blogPosts.first(where: { $0.name == name }) else {
            response.statusCode = .notFound
            return next()
        }
        
        do { try response.render("blog/\(name)", with: post, forKey: "post") } catch { Log.debug(error.localizedDescription) }
        next()
    }
}

// MARK: - RoutsCompose

extension BlogRouts: RoutsCompose {

    public func coposeRouts(with database: Database?) {
        self.database = database
        router.setDefault(templateEngine: StencilTemplateEngine())
        router.all(Constants.BlogRouts.publicPath, middleware: StaticFileServer())
        router.get(Constants.BlogRouts.blog, handler: blog)
        router.get(Constants.BlogRouts.blogEntry, handler: blogEntry)
    }
}
