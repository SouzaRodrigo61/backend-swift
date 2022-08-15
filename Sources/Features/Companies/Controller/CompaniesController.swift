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
    }
    
    func index(req: Request) async throws -> String {
        return "Oi"
    }
    
}
