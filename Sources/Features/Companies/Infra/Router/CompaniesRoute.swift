//
//  File.swift
//  
//
//  Created by Rodrigo Souza on 14/08/22.
//

import Vapor

public func routesCompanies(_ app: Application) throws {
    try app.register(collection: CompaniesController())
}
