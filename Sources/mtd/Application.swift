import Foundation
import Kitura
import LoggerAPI
import Configuration
import CloudEnvironment
import KituraContracts
import Health
import Application
import CouchDB

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
//        connection.create { [weak self] result in
//            switch result {
//            case .failure(let error):
//                print(error)
//            case .success(let database):
//                self?.routs.connectRouts(for: database)
//            }
//        }
        routs.connectRouts(for: nil)
        Kitura.addHTTPServer(onPort: self.cloudEnv.port, with: self.router)
        Kitura.run()
        
    }
}

extension App {
    public static let health = Health()
}

