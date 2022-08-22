//
//  CreateOrderUseCase.swift
//  
//
//  Created by Rodrigo Souza on 19/08/22.
//

import Fluent

struct CreateOrderUseCase {
    static let shared = CreateOrderUseCase()
    
    func execute(order: Orders, database: Database) async throws {
        try await order.save(on: database)
    }
}
