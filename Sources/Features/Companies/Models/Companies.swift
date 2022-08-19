//
//  Companies.swift
//  
//
//  Created by Rodrigo Souza on 14/08/22.
//

import Fluent
import Vapor

final class Companies: Model, Content {
    
    static let schema = "companies"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "cnpj")
    var cnpj: String
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "location")
    var location: String
    
    @Enum(key: "company_status")
    var status: CompanyStatus
    
    // When this Planet was created.
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    // When this Planet was last updated.
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }
    
    init(cnpj: String,
         name: String,
         location: String,
         status: CompanyStatus
    ) {
        self.cnpj = cnpj
        self.name = name
        self.location = location
        self.status = status
    }
}
