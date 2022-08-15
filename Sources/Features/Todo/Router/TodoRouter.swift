//
//  File.swift
//  
//
//  Created by Rodrigo Souza on 14/08/22.
//

import Foundation
import Vapor

public func routesTodo(_ app: Application) throws {
    try app.register(collection: TodoController())
}
