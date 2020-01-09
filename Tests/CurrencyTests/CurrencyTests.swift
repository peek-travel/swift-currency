import XCTest
@testable import Currency

final class CurrencyTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Currency().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
