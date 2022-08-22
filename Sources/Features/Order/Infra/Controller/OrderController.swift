//
//  OrderController.swift
//  
//
//  Created by Rodrigo Souza on 18/08/22.
//

import Foundation
import Vapor
import Utils

struct OrderController: RouteCollection {
    let encoder = JSONFormatter()
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        let order = routes.grouped("order")
        order.get(use: index)
        order.post(use: create)
    }
    
    func index(req: Request) async throws -> Response {
        let orders = try await ListOrderUseCase.shared.execute(database: req.db)
        
        let json = try encoder.encode(orders)
        return .init(status: .ok, body: .init(data: json))
    }
    
    func create(req: Request) async throws -> Response {
        let order = try req.content.decode(Orders.self)
        
        try await CreateOrderUseCase.shared.execute(order: order, database: req.db)
        
        let json = try encoder.encode(order)
        return .init(status: .created, body: .init(data: json))
    }
    
}
