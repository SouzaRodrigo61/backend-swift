//
//  File.swift
//  
//
//  Created by Rodrigo Souza on 18/08/22.
//

import Vapor

public func routesOrder(_ app: Application) throws {
    try app.register(collection: OrderController())
}
