//
//  ProductType.swift
//  
//
//  Created by Rodrigo Souza on 16/08/22.
//

import Fluent
import Vapor



final class ProductType: Model, Content {
    static let schema = "product_type"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "description")
    var description: String
    
    init() { }
    
    init(description: String) {
        self.description = description
    }
}
