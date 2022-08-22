//
//  ProductTypeMigrate.swift
//  
//
//  Created by Rodrigo Souza on 16/08/22.
//

import Fluent

public func productTypeMigrate(migrate: Migrations) {
    migrate.add(CreateProductType())
}
