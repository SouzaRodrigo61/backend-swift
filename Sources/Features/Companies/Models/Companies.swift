//
//  Companies.swift
//  
//
//  Created by Rodrigo Souza on 14/08/22.
//

import Fluent
import Vapor

final class Companies: Model, Content {
    //    typealias IDValue = String
    
    static let schema = "companies"
    
    @ID(custom: "cnpj", generatedBy: .user)
    var id: String?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "location")
    var location: String
    
    // When this Planet was created.
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    // When this Planet was last updated.
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }
    
    //    init(id: UUID? = nil, title: String) {
    //        self.id = id
    //        self.title = title
    //    }
}
