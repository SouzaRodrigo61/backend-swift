//
//  File.swift
//  
//
//  Created by Rodrigo Souza on 14/08/22.
//

import Foundation
import Fluent

public struct CompaniesTodo: AsyncMigration {
    public init() {}
    
    public func prepare(on database: FluentKit.Database) async throws {
        try await database.schema("companies")
            .field("id", .uuid, .identifier(auto: true))
            .field("name", .string, .required)
            .field("location", .string, .required)
            .field("create_at", .datetime, .identifier(auto: true))
            .field("update_at", .datetime, .required)
            .create()
    }

    public func revert(on database: FluentKit.Database) async throws {
        try await database.schema("companies").delete()
    }
    
}
