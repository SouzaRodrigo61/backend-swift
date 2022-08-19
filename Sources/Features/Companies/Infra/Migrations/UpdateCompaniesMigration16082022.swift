//
//  16082022CompaniesMigration.swift
//  
//
//  Created by Rodrigo Souza on 16/08/22.
//

import Foundation
import Fluent

struct Update16082022CompaniesMigration: AsyncMigration {
    func prepare(on database: FluentKit.Database) async throws {
        let companyStatus = try await database.enum("company_status")
            .case("alive")
            .case("closed")
            .create()
        
        try await database.schema("companies")
            .field("company_status", companyStatus, .required)
            .update()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema("companies")
            .deleteField("company_status")
            .update()
    }
    
}
