//
//  File.swift
//  
//
//  Created by Rodrigo Souza on 19/08/22.
//

import Vapor
import Fluent
import Features

func migrate(migrate: Migrations) {
    companyMigrate(migrate: migrate)
    productTypeMigrate(migrate: migrate)
    orderMigrate(migrate: migrate)
    
    migrate.add(SessionRecord.migration)
    migrate.add(CreateTodo())
}
