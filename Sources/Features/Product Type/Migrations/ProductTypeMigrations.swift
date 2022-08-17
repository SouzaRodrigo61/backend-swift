//
//  ProductTypeMigrations.swift
//  
//
//  Created by Rodrigo Souza on 16/08/22.
//

import Fluent

struct CreateProductType: AsyncMigration {
    
    func prepare(on database: FluentKit.Database) async throws {
        try await database.schema("product_type")
            .id()
            .field("description", .string, .required)
            .create()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema("product_type").delete()
    }
    
}
