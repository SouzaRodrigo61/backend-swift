//
//  File.swift
//  
//
//  Created by Rodrigo Souza on 14/08/22.
//

import Foundation
import Fluent

public struct CreateCompanies: AsyncMigration {
    public init() {}
    
    public func prepare(on database: FluentKit.Database) async throws {
        try await database.schema("companies")
            .id()
            .field("cnpj", .string, .required)
            .unique(on: "cnpj", name: "no_duplicate_cnpj")
            .field("name", .string, .required)
            .field("location", .string, .required)
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .create()
    }

    public func revert(on database: FluentKit.Database) async throws {
        try await database.schema("companies").delete()
    }
    
}
