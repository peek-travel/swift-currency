#if !canImport(ObjectiveC)
import XCTest

extension CurrencyMintTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__CurrencyMintTests = [
        ("testLookupByNum_fails", testLookupByNum_fails),
        ("testLookupByNum_passes", testLookupByNum_passes),
        ("testLookupByNum_withAmount", testLookupByNum_withAmount),
        ("testLookupByString_fails", testLookupByString_fails),
        ("testLookupByString_passes", testLookupByString_passes),
        ("testLookupByString_withAmount", testLookupByString_withAmount),
    ]
}

extension MoneyTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__MoneyTests = [
        ("testAddition", testAddition),
        ("testComparable", testComparable),
        ("testDescription", testDescription),
        ("testDivision", testDivision),
        ("testEquatable", testEquatable),
        ("testHashable", testHashable),
        ("testInit", testInit),
        ("testMinorUnits", testMinorUnits),
        ("testMultiplication", testMultiplication),
        ("testStringInterpolation_customFormatter", testStringInterpolation_customFormatter),
        ("testStringInterpolation_customLocale", testStringInterpolation_customLocale),
        ("testStringInterpolation_defaultFormatter", testStringInterpolation_defaultFormatter),
        ("testStringInterpolation_description", testStringInterpolation_description),
        ("testStringInterpolation_optional", testStringInterpolation_optional),
        ("testSubtraction", testSubtraction),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CurrencyMintTests.__allTests__CurrencyMintTests),
        testCase(MoneyTests.__allTests__MoneyTests),
    ]
}
#endif
