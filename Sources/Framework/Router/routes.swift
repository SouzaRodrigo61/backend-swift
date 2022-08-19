import Features
import Vapor

func routes(_ app: Application) throws {
    try routesTodo(app)
    try routesOrder(app)
    try routesCompanies(app)
    try routesProductType(app)
}
