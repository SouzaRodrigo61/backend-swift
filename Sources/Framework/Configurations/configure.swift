import Features
import Fluent
import FluentMySQLDriver
import Vapor

/// Used to check wheather we should send a confirmation email when a user creates an account,
/// or if they should be auto-confirmed.
/// - Note: This variable is set through the environment variable "EMAIL_CONFIRMATION" and "on/off" as values.
var emailConfirmation: Bool = true

/// The configuration key for wheather user registration is open to the public
/// or must be executed by an admin user.
/// - Note: This variable can be set through the environment variable "OPEN_REGISTRATION" and "on/off" as values.
var openRegistration: Bool = false

/// Called before your application initializes.
///
/// https://docs.vapor.codes/3.0/getting-started/structure/#configureswift
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    // Add CORS with default configuration
    app.middleware.use(CORSMiddleware())
    
    app.http.server.configuration.port = Int(Environment.get("OWOC_PORT") ?? "0000") ?? 8080
    
    var tls = TLSConfiguration.makeClientConfiguration()
    tls.certificateVerification = .none
    
    app.databases.use(.mysql(
        hostname: "l1b24gdqhbi1.aws-sa-east-1-1.psdb.cloud",
        port: MySQLConfiguration.ianaPortNumber,
        username: "rsyehdv9rgyr",
        password: "pscale_pw_6lEXuKj7tg8G6HjngGip4d9qYJ5xBL5wzBIk6RSjblU",
        database: "owoc",
        // hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        // port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? MySQLConfiguration.ianaPortNumber,
        // username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
        // password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
        // database: Environment.get("DATABASE_NAME") ?? "vapor_database",
        tlsConfiguration: tls
    ), as: .mysql)

    app.migrations.add(CreateTodo())
    app.migrations.add(CreateCompanies())
    
    try app.autoMigrate().wait()
    
    // register routes
    try routes(app)
}

// DATABASE_NAME: owoc
// DATABASE_USERNAME: rsyehdv9rgyr
// DATABASE_HOST: l1b24gdqhbi1.aws-sa-east-1-1.psdb.cloud
// DATABASE_PASSWORD: pscale_pw_6lEXuKj7tg8G6HjngGip4d9qYJ5xBL5wzBIk6RSjblU
// OWOC_PORT: 4000

// hostname: "l1b24gdqhbi1.aws-sa-east-1-1.psdb.cloud",
// port: MySQLConfiguration.ianaPortNumber,
// username: "rsyehdv9rgyr",
// password: "pscale_pw_6lEXuKj7tg8G6HjngGip4d9qYJ5xBL5wzBIk6RSjblU",
// database: "owoc",