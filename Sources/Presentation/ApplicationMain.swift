//
//  ApplicationMain.swift
//  Presentation
//  
//
//  Created by Rodrigo Souza on 12/08/22.
//

import App
import Vapor

/// This application is start here🏃‍♂️
/// - throws:
///  See `ApplicationUseCase.initialize()` and `ApplicationUseCase.launch()`

public func applicationMain() {
    
    do {
        var env = try Environment.detect()
        try LoggingSystem.bootstrap(from: &env)
        
        let app = Application(env)
        defer { app.shutdown() }
        
        app.logger.info("Server starting ..")
        
        try configure(app)
        try app.run()

    } catch {
        exit(1)
    }
}
