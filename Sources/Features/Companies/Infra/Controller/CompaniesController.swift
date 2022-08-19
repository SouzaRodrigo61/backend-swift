//
//  File.swift
//  
//
//  Created by Rodrigo Souza on 14/08/22.
//

import Foundation
import Vapor

struct CompaniesController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let companies = routes.grouped("companies")
        companies.get(use: index)
        companies.post(use: create)
    }
    
    func index(req: Request) async throws -> [Companies] {
        return try await Companies.query(on: req.db).all()
    }
    
    func create(req: Request) async throws -> Companies {
        let company = try req.content.decode(Companies.self)
        try await company.save(on: req.db)
        return company
    }
    
}
