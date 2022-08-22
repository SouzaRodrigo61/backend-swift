//
//  OrderMigrate.swift
//  
//
//  Created by Rodrigo Souza on 18/08/22.
//

import Fluent

public func orderMigrate(migrate: Migrations) {
    migrate.add(CreateOrder())
}
