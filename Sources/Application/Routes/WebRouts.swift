//
//  WebRouts.swift
//  Application
//
//  Created by Daniel Mandea on 24/06/2019.
//

import Foundation
import Kitura
import LoggerAPI
import KituraStencil
import Configuration
import CouchDB

public class WebRouts {
    
    // MARK: Internal
    
    var router: Router
    
    // MARK: - Init
    
    public init(router: Router) {
        self.router = router
    }
    
    // MARK: - Routs
    
    func index(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) {
        do { try response.render(Constants.BlogRouts.index, context: [:]) } catch { Log.debug(error.localizedDescription) }
        next()
    }
    
    func books(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) {
        do { try response.render(Constants.BlogRouts.books, context: [:]) } catch { Log.debug(error.localizedDescription) }
        next()
    }
    
    func about(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) {
        do { try response.render(Constants.BlogRouts.about, context: [:]) } catch { Log.debug(error.localizedDescription) }
        next()
    }
}

// MARK: - RoutsCompose

extension WebRouts: RoutsCompose {
    
    public func coposeRouts(with database: Database?) {
        router.setDefault(templateEngine: StencilTemplateEngine())
        router.all(Constants.BlogRouts.publicPath, middleware: StaticFileServer())
        router.get(Constants.BlogRouts.indexPath, handler: index)
        router.get(Constants.BlogRouts.books, handler: books)
        router.get(Constants.BlogRouts.about, handler: about)
    }
}
