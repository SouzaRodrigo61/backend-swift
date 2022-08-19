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
    
    // MARK: CORS with default configuration
    let corsConfiguration = CORSMiddleware.Configuration(
        allowedOrigin: .all,
        allowedMethods: [.GET, .POST, .PUT, .OPTIONS, .DELETE, .PATCH],
        allowedHeaders: [.accept, .authorization, .contentType, .origin, .xRequestedWith, .userAgent, .accessControlAllowOrigin]
    )
    let cors = CORSMiddleware(configuration: corsConfiguration)
    app.middleware.use(cors, at: .beginning)
    app.logger.info("Configurou o CORS")
    
    // MARK: Porta configuração
    app.http.server.configuration.port = Int(Environment.get("OWOC_PORT") ?? "0000") ?? 8080
    app.logger.info("Configurou a porta")

    // MARK: Database connection
    var tls = TLSConfiguration.makeClientConfiguration()
    tls.certificateVerification = .none
    app.databases.use(.mysql(
         hostname: Environment.get("DATABASE_HOST") ?? "localhost",
         port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? MySQLConfiguration.ianaPortNumber,
         username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
         password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
         database: Environment.get("DATABASE_NAME") ?? "vapor_database",
        tlsConfiguration: tls
    ), as: .mysql)
    
    app.sessions.use(.fluent(.mysql))

    
    // MARK: Migrations
    app.logger.info("Subiu o ambiente do mysql")
    migrate(migrate: app.migrations)
    try app.autoMigrate().wait()
    app.logger.info("Subiu os migrations necessarios")
    
    // MARK: register Routes
    try routes(app)
}

//        hostname: "f7cqt8z44y8d.us-east-1.psdb.cloud",
//        port: MySQLConfiguration.ianaPortNumber,
//        username: "gcoc7pqw06ph",
//        password: "pscale_pw_9wjDPJdfycGOeKLxpi3eLEe8RzxjQG-bbiqKWPEyA7c",
//        database: "owoc",
