//
//  ListOrderUseCase.swift
//  
//
//  Created by Rodrigo Souza on 19/08/22.
//

import Vapor
import Fluent

struct ListOrderUseCase {
    static let shared = ListOrderUseCase()
    
    func execute(database: Database) async throws -> [Orders] {
        return try await Orders.query(on: database).all()
    }
}
