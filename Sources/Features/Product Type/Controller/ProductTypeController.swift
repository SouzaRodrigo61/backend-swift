//
//  ProductTypeController.swift
//  
//
//  Created by Rodrigo Souza on 16/08/22.
//

import Foundation
import Vapor

struct ProductTypeController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let productType = routes.grouped("product_type")
        productType.get(use: index)
        productType.post(use: create)
    }
    
    func index(req: Request) async throws -> [ProductType] {
        return try await ProductType.query(on: req.db).all()
    }
    
    func create(req: Request) async throws -> ProductType {
        let productType = try req.content.decode(ProductType.self)
        try await productType.save(on: req.db)
        return productType
    }
    
}
