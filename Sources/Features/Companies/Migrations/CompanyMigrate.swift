//
//  File.swift
//  
//
//  Created by Rodrigo Souza on 16/08/22.
//

import Fluent

public func companyMigrate(migrate: Migrations) {
    migrate.add(CreateCompanies())
    migrate.add(Update16082022CompaniesMigration())
}
