//
//  JsonFormatter.swift
//  
//
//  Created by Rodrigo Souza on 20/08/22.
//

import Foundation

public func JSONFormatter() -> JSONEncoder {
    let encoder = JSONEncoder()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    encoder.dateEncodingStrategy = .formatted(formatter)
    
    return encoder
}
