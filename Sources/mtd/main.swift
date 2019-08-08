import Foundation
import Kitura
import LoggerAPI
import Configuration
import CloudEnvironment
import KituraContracts
import Health
import Application
import CouchDB
import HeliumLogger

do {
    HeliumLogger.use(LoggerMessageType.info)
    let router = Router()
    let env = CloudEnv()
    let routs = DefaultRoutesConnection(routes: [BlogRouts(router: router), HealthRouts(router: router, health: App.health), WebRouts(router: router)])
    let connection = DefaultCouchDBConnection(properties: DatabaseConnection.connectionProprieties!)
    let app = try App(router: router, cloudEnv: env, routs: routs, connection: connection )
    try app.run()
} catch let error {
    Log.error(error.localizedDescription)
}
