import Features
import Framework
import XCTVapor

final class AppTests: XCTestCase {
    func testHelloWorld() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        
        try app.test(.GET, "order", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
        })
        
        try app.test(.GET, "todos", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
        })
        
        try app.test(.GET, "companies", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
        })
        
        
    }
}
