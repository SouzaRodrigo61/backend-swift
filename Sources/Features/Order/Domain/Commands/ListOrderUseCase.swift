//
//  File.swift
//  
//
//  Created by Rodrigo Souza on 19/08/22.
//

import Vapor
import Fluent

struct ListOrderUseCase {
    static let shared = ListOrderUseCase()
    
    func execute(_ logger: Logger,database: Database) async throws -> [Orders] {
        return try await Orders.query(on: database).all()
    }
}
