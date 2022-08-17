import Features
import Vapor

func routes(_ app: Application) throws {
    try routesTodo(app)
    try routesCompanies(app)
    try routesProductType(app)
}
