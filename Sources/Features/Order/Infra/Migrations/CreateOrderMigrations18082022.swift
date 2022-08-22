//
//  CreateOrder.swift
//  
//
//  Created by Rodrigo Souza on 18/08/22.
//

import Fluent

struct CreateOrder: AsyncMigration {
    
    func prepare(on database: FluentKit.Database) async throws {
        try await database.schema(Orders.schema)
            .id()
            .field("description", .string, .required)
            .field("type_of_product", .uuid, .required)
            .field("id_company", .uuid, .required)
            .field("quantity", .int8, .required)
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .create()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema(Orders.schema).delete()
    }
    
}
