//
//  Order.swift
//  
//
//  Created by Rodrigo Souza on 18/08/22.
//

import Fluent
import Vapor

final class Orders: Model, Content {
    
    static let schema = "order"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "description")
    var description: String
    
    @Field(key: "quantity")
    var quantity: Int
    
    @Field(key: "type_of_product")
    var productType: UUID
    
    @Field(key: "id_company")
    var company: UUID
    
    // When this Planet was created.
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    // When this Planet was last updated.
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }
}
