//
//  OrderController.swift
//  
//
//  Created by Rodrigo Souza on 18/08/22.
//

import Foundation
import Vapor

struct OrderController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let order = routes.grouped("order")
        order.get(use: index)
        order.post(use: create)
    }
    
    func index(req: Request) async throws -> [Orders] {
        return try await Orders.query(on: req.db).all()
    }
    
    func create(req: Request) async throws -> Orders {
        let order = try req.content.decode(Orders.self)
        try await order.save(on: req.db)
        return order
    }
    
}
