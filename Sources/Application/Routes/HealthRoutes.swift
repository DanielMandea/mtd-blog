import LoggerAPI
import Health
import KituraContracts
import Kitura
import LoggerAPI
import CouchDB

public class HealthRouts {
    
    var router: Router
    var health: Health
    
    public init(router: Router, health: Health) {
        self.router = router
        self.health = health
    }

    /**
     * Handler for getting a text/plain response of application health status.
     */
    public func getHealthCheck(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
        let status = health.status
        if health.status.state == .UP {
            try response.status(.OK).send(status).end()
        } else {
            try response.status(.serviceUnavailable).send(status).end()
        }
    }
}

// MARK: RoutsCompose

extension HealthRouts: RoutsCompose {
    public func coposeRouts(with database: Database) {
        // Basic application health check
        router.get(Constants.HealthRouts.health, handler: getHealthCheck)
    }
}

