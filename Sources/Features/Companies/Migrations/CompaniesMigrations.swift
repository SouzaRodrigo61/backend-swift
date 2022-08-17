//
//  File.swift
//  
//
//  Created by Rodrigo Souza on 14/08/22.
//

import Fluent

struct CreateCompanies: AsyncMigration {
    
    func prepare(on database: FluentKit.Database) async throws {
        let companyStatus = try await database.enum("company_status")
            .case("alive")
            .case("closed")
            .create()
        
        try await database.schema("companies")
            .id()
            .field("cnpj", .string, .required)
            .unique(on: "cnpj", name: "no_duplicate_cnpj")
            .field("name", .string, .required)
            .field("location", .string, .required)
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .create()
        
        try await database.schema("companies")
            .field("company_status", companyStatus, .required)
            .update()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema("companies").delete()
    }
    
}
