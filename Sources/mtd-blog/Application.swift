import Foundation
import Kitura
import LoggerAPI
import Configuration
import CloudEnvironment
import KituraContracts
import Health
import Application
import CouchDB
import KituraOpenAPI

public let projectPath = ConfigurationManager.BasePath.project.path

public class App {
    
    // MARK - Internal 
    
    var router: Router!
    var cloudEnv: CloudEnv!
    var routs: RoutsConnection!
    var connection: CouchDBConnection!
    
    // MARK: - Init

    public init(router: Router, cloudEnv: CloudEnv, routs: RoutsConnection, connection: CouchDBConnection) throws {
        self.router = router
        self.cloudEnv = cloudEnv
        self.routs = routs
        self.connection = connection
        try Metrics.initializeMetrics(router: router)
    }

    public func run() throws {
        connection.create { [weak self] result in
            guard let `self` = self else {return}
            switch result {
            case .failure(let error):
                print(error)
            case .success(let database):
                self.routs.connectRouts(for: database)
            }
            KituraOpenAPI.addEndpoints(to: self.router)
        }
        Kitura.addHTTPServer(onPort: self.cloudEnv.port, with: self.router)
        Kitura.run()
    }
}

extension App {
    public static let health = Health()
}

