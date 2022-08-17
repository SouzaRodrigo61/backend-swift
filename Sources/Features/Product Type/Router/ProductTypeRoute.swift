//
//  ProductTypeRoute.swift
//  
//
//  Created by Rodrigo Souza on 16/08/22.
//

import Foundation
import Vapor

public func routesProductType(_ app: Application) throws {
    try app.register(collection: ProductTypeController())
}
