import Kitura
import SwiftMetrics
import SwiftMetricsDash
import SwiftMetricsPrometheus
import SwiftMetricsREST
import LoggerAPI

var swiftMetrics: SwiftMetrics?
var swiftMetricsDash: SwiftMetricsDash?
var swiftMetricsPrometheus: SwiftMetricsPrometheus?
var swiftMetricsRest: SwiftMetricsREST?

public class Metrics {
    
    public static func initializeMetrics(router: Router) throws {
        let metrics = try SwiftMetrics()
        let dashboard = try SwiftMetricsDash(swiftMetricsInstance: metrics, endpoint: router)
        let prometheus = try SwiftMetricsPrometheus(swiftMetricsInstance: metrics, endpoint: router)
        let rest = try SwiftMetricsREST(swiftMetricsInstance: metrics, endpoint: router)
        
        swiftMetrics = metrics
        swiftMetricsDash = dashboard
        swiftMetricsPrometheus = prometheus
        swiftMetricsRest = rest
        Log.info("Initialized metrics.")
    }
}
