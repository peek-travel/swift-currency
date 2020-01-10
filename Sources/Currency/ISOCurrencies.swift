//===----------------------------------------------------------------------===//
//
// This source file is part of the Currency open source project
//
// Copyright (c) 2020 Currency project authors
// Licensed under MIT License
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of Currency project authors
//
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

import struct Foundation.Decimal

/// This is a "private" protocol for conforming all ISO 4217 money types to a list of different protocols.
/// - Warning: Do not conform any type to this protocol, nor use it as a type constraint.
///
/// Breaking changes to this **will** be allowed outside of major semver changes.
public protocol _MoneyUmbrellaProtocol: Money, CurrencyMetadata,
  Comparable, Hashable,
  ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral,
  AdditiveArithmetic { }

// Contents following this line are automatically generated, and should not be edited.

// MARK: -
// MARK: ISO 4217 Currencies

/// The UAE Dirham (AED).
public struct AED: _MoneyUmbrellaProtocol {
  public static var name: String { return "UAE Dirham" }
  public static var alphabeticCode: String { return "AED" }
  public static var numericCode: UInt16 { return 784 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Afghani (AFN).
public struct AFN: _MoneyUmbrellaProtocol {
  public static var name: String { return "Afghani" }
  public static var alphabeticCode: String { return "AFN" }
  public static var numericCode: UInt16 { return 971 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Lek (ALL).
public struct ALL: _MoneyUmbrellaProtocol {
  public static var name: String { return "Lek" }
  public static var alphabeticCode: String { return "ALL" }
  public static var numericCode: UInt16 { return 8 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Armenian Dram (AMD).
public struct AMD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Armenian Dram" }
  public static var alphabeticCode: String { return "AMD" }
  public static var numericCode: UInt16 { return 51 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Netherlands Antillean Guilder (ANG).
public struct ANG: _MoneyUmbrellaProtocol {
  public static var name: String { return "Netherlands Antillean Guilder" }
  public static var alphabeticCode: String { return "ANG" }
  public static var numericCode: UInt16 { return 532 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Kwanza (AOA).
public struct AOA: _MoneyUmbrellaProtocol {
  public static var name: String { return "Kwanza" }
  public static var alphabeticCode: String { return "AOA" }
  public static var numericCode: UInt16 { return 973 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Argentine Peso (ARS).
public struct ARS: _MoneyUmbrellaProtocol {
  public static var name: String { return "Argentine Peso" }
  public static var alphabeticCode: String { return "ARS" }
  public static var numericCode: UInt16 { return 32 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Australian Dollar (AUD).
public struct AUD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Australian Dollar" }
  public static var alphabeticCode: String { return "AUD" }
  public static var numericCode: UInt16 { return 36 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Aruban Florin (AWG).
public struct AWG: _MoneyUmbrellaProtocol {
  public static var name: String { return "Aruban Florin" }
  public static var alphabeticCode: String { return "AWG" }
  public static var numericCode: UInt16 { return 533 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Azerbaijan Manat (AZN).
public struct AZN: _MoneyUmbrellaProtocol {
  public static var name: String { return "Azerbaijan Manat" }
  public static var alphabeticCode: String { return "AZN" }
  public static var numericCode: UInt16 { return 944 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Convertible Mark (BAM).
public struct BAM: _MoneyUmbrellaProtocol {
  public static var name: String { return "Convertible Mark" }
  public static var alphabeticCode: String { return "BAM" }
  public static var numericCode: UInt16 { return 977 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Barbados Dollar (BBD).
public struct BBD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Barbados Dollar" }
  public static var alphabeticCode: String { return "BBD" }
  public static var numericCode: UInt16 { return 52 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Taka (BDT).
public struct BDT: _MoneyUmbrellaProtocol {
  public static var name: String { return "Taka" }
  public static var alphabeticCode: String { return "BDT" }
  public static var numericCode: UInt16 { return 50 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Bulgarian Lev (BGN).
public struct BGN: _MoneyUmbrellaProtocol {
  public static var name: String { return "Bulgarian Lev" }
  public static var alphabeticCode: String { return "BGN" }
  public static var numericCode: UInt16 { return 975 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Bahraini Dinar (BHD).
public struct BHD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Bahraini Dinar" }
  public static var alphabeticCode: String { return "BHD" }
  public static var numericCode: UInt16 { return 48 }
  public static var minorUnits: UInt8 { return 3 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Burundi Franc (BIF).
public struct BIF: _MoneyUmbrellaProtocol {
  public static var name: String { return "Burundi Franc" }
  public static var alphabeticCode: String { return "BIF" }
  public static var numericCode: UInt16 { return 108 }
  public static var minorUnits: UInt8 { return 0 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Bermudian Dollar (BMD).
public struct BMD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Bermudian Dollar" }
  public static var alphabeticCode: String { return "BMD" }
  public static var numericCode: UInt16 { return 60 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Brunei Dollar (BND).
public struct BND: _MoneyUmbrellaProtocol {
  public static var name: String { return "Brunei Dollar" }
  public static var alphabeticCode: String { return "BND" }
  public static var numericCode: UInt16 { return 96 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Boliviano (BOB).
public struct BOB: _MoneyUmbrellaProtocol {
  public static var name: String { return "Boliviano" }
  public static var alphabeticCode: String { return "BOB" }
  public static var numericCode: UInt16 { return 68 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Brazilian Real (BRL).
public struct BRL: _MoneyUmbrellaProtocol {
  public static var name: String { return "Brazilian Real" }
  public static var alphabeticCode: String { return "BRL" }
  public static var numericCode: UInt16 { return 986 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Bahamian Dollar (BSD).
public struct BSD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Bahamian Dollar" }
  public static var alphabeticCode: String { return "BSD" }
  public static var numericCode: UInt16 { return 44 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Ngultrum (BTN).
public struct BTN: _MoneyUmbrellaProtocol {
  public static var name: String { return "Ngultrum" }
  public static var alphabeticCode: String { return "BTN" }
  public static var numericCode: UInt16 { return 64 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Pula (BWP).
public struct BWP: _MoneyUmbrellaProtocol {
  public static var name: String { return "Pula" }
  public static var alphabeticCode: String { return "BWP" }
  public static var numericCode: UInt16 { return 72 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Belarusian Ruble (BYN).
public struct BYN: _MoneyUmbrellaProtocol {
  public static var name: String { return "Belarusian Ruble" }
  public static var alphabeticCode: String { return "BYN" }
  public static var numericCode: UInt16 { return 933 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Belize Dollar (BZD).
public struct BZD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Belize Dollar" }
  public static var alphabeticCode: String { return "BZD" }
  public static var numericCode: UInt16 { return 84 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Canadian Dollar (CAD).
public struct CAD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Canadian Dollar" }
  public static var alphabeticCode: String { return "CAD" }
  public static var numericCode: UInt16 { return 124 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Congolese Franc (CDF).
public struct CDF: _MoneyUmbrellaProtocol {
  public static var name: String { return "Congolese Franc" }
  public static var alphabeticCode: String { return "CDF" }
  public static var numericCode: UInt16 { return 976 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Swiss Franc (CHF).
public struct CHF: _MoneyUmbrellaProtocol {
  public static var name: String { return "Swiss Franc" }
  public static var alphabeticCode: String { return "CHF" }
  public static var numericCode: UInt16 { return 756 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Chilean Peso (CLP).
public struct CLP: _MoneyUmbrellaProtocol {
  public static var name: String { return "Chilean Peso" }
  public static var alphabeticCode: String { return "CLP" }
  public static var numericCode: UInt16 { return 152 }
  public static var minorUnits: UInt8 { return 0 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Yuan Renminbi (CNY).
public struct CNY: _MoneyUmbrellaProtocol {
  public static var name: String { return "Yuan Renminbi" }
  public static var alphabeticCode: String { return "CNY" }
  public static var numericCode: UInt16 { return 156 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Colombian Peso (COP).
public struct COP: _MoneyUmbrellaProtocol {
  public static var name: String { return "Colombian Peso" }
  public static var alphabeticCode: String { return "COP" }
  public static var numericCode: UInt16 { return 170 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Costa Rican Colon (CRC).
public struct CRC: _MoneyUmbrellaProtocol {
  public static var name: String { return "Costa Rican Colon" }
  public static var alphabeticCode: String { return "CRC" }
  public static var numericCode: UInt16 { return 188 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Peso Convertible (CUC).
public struct CUC: _MoneyUmbrellaProtocol {
  public static var name: String { return "Peso Convertible" }
  public static var alphabeticCode: String { return "CUC" }
  public static var numericCode: UInt16 { return 931 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Cuban Peso (CUP).
public struct CUP: _MoneyUmbrellaProtocol {
  public static var name: String { return "Cuban Peso" }
  public static var alphabeticCode: String { return "CUP" }
  public static var numericCode: UInt16 { return 192 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Cabo Verde Escudo (CVE).
public struct CVE: _MoneyUmbrellaProtocol {
  public static var name: String { return "Cabo Verde Escudo" }
  public static var alphabeticCode: String { return "CVE" }
  public static var numericCode: UInt16 { return 132 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Czech Koruna (CZK).
public struct CZK: _MoneyUmbrellaProtocol {
  public static var name: String { return "Czech Koruna" }
  public static var alphabeticCode: String { return "CZK" }
  public static var numericCode: UInt16 { return 203 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Djibouti Franc (DJF).
public struct DJF: _MoneyUmbrellaProtocol {
  public static var name: String { return "Djibouti Franc" }
  public static var alphabeticCode: String { return "DJF" }
  public static var numericCode: UInt16 { return 262 }
  public static var minorUnits: UInt8 { return 0 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Danish Krone (DKK).
public struct DKK: _MoneyUmbrellaProtocol {
  public static var name: String { return "Danish Krone" }
  public static var alphabeticCode: String { return "DKK" }
  public static var numericCode: UInt16 { return 208 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Dominican Peso (DOP).
public struct DOP: _MoneyUmbrellaProtocol {
  public static var name: String { return "Dominican Peso" }
  public static var alphabeticCode: String { return "DOP" }
  public static var numericCode: UInt16 { return 214 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Algerian Dinar (DZD).
public struct DZD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Algerian Dinar" }
  public static var alphabeticCode: String { return "DZD" }
  public static var numericCode: UInt16 { return 12 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Egyptian Pound (EGP).
public struct EGP: _MoneyUmbrellaProtocol {
  public static var name: String { return "Egyptian Pound" }
  public static var alphabeticCode: String { return "EGP" }
  public static var numericCode: UInt16 { return 818 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Nakfa (ERN).
public struct ERN: _MoneyUmbrellaProtocol {
  public static var name: String { return "Nakfa" }
  public static var alphabeticCode: String { return "ERN" }
  public static var numericCode: UInt16 { return 232 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Ethiopian Birr (ETB).
public struct ETB: _MoneyUmbrellaProtocol {
  public static var name: String { return "Ethiopian Birr" }
  public static var alphabeticCode: String { return "ETB" }
  public static var numericCode: UInt16 { return 230 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Euro (EUR).
public struct EUR: _MoneyUmbrellaProtocol {
  public static var name: String { return "Euro" }
  public static var alphabeticCode: String { return "EUR" }
  public static var numericCode: UInt16 { return 978 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Fiji Dollar (FJD).
public struct FJD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Fiji Dollar" }
  public static var alphabeticCode: String { return "FJD" }
  public static var numericCode: UInt16 { return 242 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Falkland Islands Pound (FKP).
public struct FKP: _MoneyUmbrellaProtocol {
  public static var name: String { return "Falkland Islands Pound" }
  public static var alphabeticCode: String { return "FKP" }
  public static var numericCode: UInt16 { return 238 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Pound Sterling (GBP).
public struct GBP: _MoneyUmbrellaProtocol {
  public static var name: String { return "Pound Sterling" }
  public static var alphabeticCode: String { return "GBP" }
  public static var numericCode: UInt16 { return 826 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Lari (GEL).
public struct GEL: _MoneyUmbrellaProtocol {
  public static var name: String { return "Lari" }
  public static var alphabeticCode: String { return "GEL" }
  public static var numericCode: UInt16 { return 981 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Ghana Cedi (GHS).
public struct GHS: _MoneyUmbrellaProtocol {
  public static var name: String { return "Ghana Cedi" }
  public static var alphabeticCode: String { return "GHS" }
  public static var numericCode: UInt16 { return 936 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Gibraltar Pound (GIP).
public struct GIP: _MoneyUmbrellaProtocol {
  public static var name: String { return "Gibraltar Pound" }
  public static var alphabeticCode: String { return "GIP" }
  public static var numericCode: UInt16 { return 292 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Dalasi (GMD).
public struct GMD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Dalasi" }
  public static var alphabeticCode: String { return "GMD" }
  public static var numericCode: UInt16 { return 270 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Guinean Franc (GNF).
public struct GNF: _MoneyUmbrellaProtocol {
  public static var name: String { return "Guinean Franc" }
  public static var alphabeticCode: String { return "GNF" }
  public static var numericCode: UInt16 { return 324 }
  public static var minorUnits: UInt8 { return 0 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Quetzal (GTQ).
public struct GTQ: _MoneyUmbrellaProtocol {
  public static var name: String { return "Quetzal" }
  public static var alphabeticCode: String { return "GTQ" }
  public static var numericCode: UInt16 { return 320 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Guyana Dollar (GYD).
public struct GYD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Guyana Dollar" }
  public static var alphabeticCode: String { return "GYD" }
  public static var numericCode: UInt16 { return 328 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Hong Kong Dollar (HKD).
public struct HKD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Hong Kong Dollar" }
  public static var alphabeticCode: String { return "HKD" }
  public static var numericCode: UInt16 { return 344 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Lempira (HNL).
public struct HNL: _MoneyUmbrellaProtocol {
  public static var name: String { return "Lempira" }
  public static var alphabeticCode: String { return "HNL" }
  public static var numericCode: UInt16 { return 340 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Kuna (HRK).
public struct HRK: _MoneyUmbrellaProtocol {
  public static var name: String { return "Kuna" }
  public static var alphabeticCode: String { return "HRK" }
  public static var numericCode: UInt16 { return 191 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Gourde (HTG).
public struct HTG: _MoneyUmbrellaProtocol {
  public static var name: String { return "Gourde" }
  public static var alphabeticCode: String { return "HTG" }
  public static var numericCode: UInt16 { return 332 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Forint (HUF).
public struct HUF: _MoneyUmbrellaProtocol {
  public static var name: String { return "Forint" }
  public static var alphabeticCode: String { return "HUF" }
  public static var numericCode: UInt16 { return 348 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Rupiah (IDR).
public struct IDR: _MoneyUmbrellaProtocol {
  public static var name: String { return "Rupiah" }
  public static var alphabeticCode: String { return "IDR" }
  public static var numericCode: UInt16 { return 360 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The New Israeli Sheqel (ILS).
public struct ILS: _MoneyUmbrellaProtocol {
  public static var name: String { return "New Israeli Sheqel" }
  public static var alphabeticCode: String { return "ILS" }
  public static var numericCode: UInt16 { return 376 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Indian Rupee (INR).
public struct INR: _MoneyUmbrellaProtocol {
  public static var name: String { return "Indian Rupee" }
  public static var alphabeticCode: String { return "INR" }
  public static var numericCode: UInt16 { return 356 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Iraqi Dinar (IQD).
public struct IQD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Iraqi Dinar" }
  public static var alphabeticCode: String { return "IQD" }
  public static var numericCode: UInt16 { return 368 }
  public static var minorUnits: UInt8 { return 3 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Iranian Rial (IRR).
public struct IRR: _MoneyUmbrellaProtocol {
  public static var name: String { return "Iranian Rial" }
  public static var alphabeticCode: String { return "IRR" }
  public static var numericCode: UInt16 { return 364 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Iceland Krona (ISK).
public struct ISK: _MoneyUmbrellaProtocol {
  public static var name: String { return "Iceland Krona" }
  public static var alphabeticCode: String { return "ISK" }
  public static var numericCode: UInt16 { return 352 }
  public static var minorUnits: UInt8 { return 0 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Jamaican Dollar (JMD).
public struct JMD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Jamaican Dollar" }
  public static var alphabeticCode: String { return "JMD" }
  public static var numericCode: UInt16 { return 388 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Jordanian Dinar (JOD).
public struct JOD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Jordanian Dinar" }
  public static var alphabeticCode: String { return "JOD" }
  public static var numericCode: UInt16 { return 400 }
  public static var minorUnits: UInt8 { return 3 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Yen (JPY).
public struct JPY: _MoneyUmbrellaProtocol {
  public static var name: String { return "Yen" }
  public static var alphabeticCode: String { return "JPY" }
  public static var numericCode: UInt16 { return 392 }
  public static var minorUnits: UInt8 { return 0 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Kenyan Shilling (KES).
public struct KES: _MoneyUmbrellaProtocol {
  public static var name: String { return "Kenyan Shilling" }
  public static var alphabeticCode: String { return "KES" }
  public static var numericCode: UInt16 { return 404 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Som (KGS).
public struct KGS: _MoneyUmbrellaProtocol {
  public static var name: String { return "Som" }
  public static var alphabeticCode: String { return "KGS" }
  public static var numericCode: UInt16 { return 417 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Riel (KHR).
public struct KHR: _MoneyUmbrellaProtocol {
  public static var name: String { return "Riel" }
  public static var alphabeticCode: String { return "KHR" }
  public static var numericCode: UInt16 { return 116 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Comorian Franc (KMF).
public struct KMF: _MoneyUmbrellaProtocol {
  public static var name: String { return "Comorian Franc" }
  public static var alphabeticCode: String { return "KMF" }
  public static var numericCode: UInt16 { return 174 }
  public static var minorUnits: UInt8 { return 0 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The North Korean Won (KPW).
public struct KPW: _MoneyUmbrellaProtocol {
  public static var name: String { return "North Korean Won" }
  public static var alphabeticCode: String { return "KPW" }
  public static var numericCode: UInt16 { return 408 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Won (KRW).
public struct KRW: _MoneyUmbrellaProtocol {
  public static var name: String { return "Won" }
  public static var alphabeticCode: String { return "KRW" }
  public static var numericCode: UInt16 { return 410 }
  public static var minorUnits: UInt8 { return 0 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Kuwaiti Dinar (KWD).
public struct KWD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Kuwaiti Dinar" }
  public static var alphabeticCode: String { return "KWD" }
  public static var numericCode: UInt16 { return 414 }
  public static var minorUnits: UInt8 { return 3 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Cayman Islands Dollar (KYD).
public struct KYD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Cayman Islands Dollar" }
  public static var alphabeticCode: String { return "KYD" }
  public static var numericCode: UInt16 { return 136 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Tenge (KZT).
public struct KZT: _MoneyUmbrellaProtocol {
  public static var name: String { return "Tenge" }
  public static var alphabeticCode: String { return "KZT" }
  public static var numericCode: UInt16 { return 398 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Lao Kip (LAK).
public struct LAK: _MoneyUmbrellaProtocol {
  public static var name: String { return "Lao Kip" }
  public static var alphabeticCode: String { return "LAK" }
  public static var numericCode: UInt16 { return 418 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Lebanese Pound (LBP).
public struct LBP: _MoneyUmbrellaProtocol {
  public static var name: String { return "Lebanese Pound" }
  public static var alphabeticCode: String { return "LBP" }
  public static var numericCode: UInt16 { return 422 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Sri Lanka Rupee (LKR).
public struct LKR: _MoneyUmbrellaProtocol {
  public static var name: String { return "Sri Lanka Rupee" }
  public static var alphabeticCode: String { return "LKR" }
  public static var numericCode: UInt16 { return 144 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Liberian Dollar (LRD).
public struct LRD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Liberian Dollar" }
  public static var alphabeticCode: String { return "LRD" }
  public static var numericCode: UInt16 { return 430 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Loti (LSL).
public struct LSL: _MoneyUmbrellaProtocol {
  public static var name: String { return "Loti" }
  public static var alphabeticCode: String { return "LSL" }
  public static var numericCode: UInt16 { return 426 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Libyan Dinar (LYD).
public struct LYD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Libyan Dinar" }
  public static var alphabeticCode: String { return "LYD" }
  public static var numericCode: UInt16 { return 434 }
  public static var minorUnits: UInt8 { return 3 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Moroccan Dirham (MAD).
public struct MAD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Moroccan Dirham" }
  public static var alphabeticCode: String { return "MAD" }
  public static var numericCode: UInt16 { return 504 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Moldovan Leu (MDL).
public struct MDL: _MoneyUmbrellaProtocol {
  public static var name: String { return "Moldovan Leu" }
  public static var alphabeticCode: String { return "MDL" }
  public static var numericCode: UInt16 { return 498 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Malagasy Ariary (MGA).
public struct MGA: _MoneyUmbrellaProtocol {
  public static var name: String { return "Malagasy Ariary" }
  public static var alphabeticCode: String { return "MGA" }
  public static var numericCode: UInt16 { return 969 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Denar (MKD).
public struct MKD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Denar" }
  public static var alphabeticCode: String { return "MKD" }
  public static var numericCode: UInt16 { return 807 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Kyat (MMK).
public struct MMK: _MoneyUmbrellaProtocol {
  public static var name: String { return "Kyat" }
  public static var alphabeticCode: String { return "MMK" }
  public static var numericCode: UInt16 { return 104 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Tugrik (MNT).
public struct MNT: _MoneyUmbrellaProtocol {
  public static var name: String { return "Tugrik" }
  public static var alphabeticCode: String { return "MNT" }
  public static var numericCode: UInt16 { return 496 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Pataca (MOP).
public struct MOP: _MoneyUmbrellaProtocol {
  public static var name: String { return "Pataca" }
  public static var alphabeticCode: String { return "MOP" }
  public static var numericCode: UInt16 { return 446 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Ouguiya (MRU).
public struct MRU: _MoneyUmbrellaProtocol {
  public static var name: String { return "Ouguiya" }
  public static var alphabeticCode: String { return "MRU" }
  public static var numericCode: UInt16 { return 929 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Mauritius Rupee (MUR).
public struct MUR: _MoneyUmbrellaProtocol {
  public static var name: String { return "Mauritius Rupee" }
  public static var alphabeticCode: String { return "MUR" }
  public static var numericCode: UInt16 { return 480 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Rufiyaa (MVR).
public struct MVR: _MoneyUmbrellaProtocol {
  public static var name: String { return "Rufiyaa" }
  public static var alphabeticCode: String { return "MVR" }
  public static var numericCode: UInt16 { return 462 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Malawi Kwacha (MWK).
public struct MWK: _MoneyUmbrellaProtocol {
  public static var name: String { return "Malawi Kwacha" }
  public static var alphabeticCode: String { return "MWK" }
  public static var numericCode: UInt16 { return 454 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Mexican Peso (MXN).
public struct MXN: _MoneyUmbrellaProtocol {
  public static var name: String { return "Mexican Peso" }
  public static var alphabeticCode: String { return "MXN" }
  public static var numericCode: UInt16 { return 484 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Malaysian Ringgit (MYR).
public struct MYR: _MoneyUmbrellaProtocol {
  public static var name: String { return "Malaysian Ringgit" }
  public static var alphabeticCode: String { return "MYR" }
  public static var numericCode: UInt16 { return 458 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Mozambique Metical (MZN).
public struct MZN: _MoneyUmbrellaProtocol {
  public static var name: String { return "Mozambique Metical" }
  public static var alphabeticCode: String { return "MZN" }
  public static var numericCode: UInt16 { return 943 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Namibia Dollar (NAD).
public struct NAD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Namibia Dollar" }
  public static var alphabeticCode: String { return "NAD" }
  public static var numericCode: UInt16 { return 516 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Naira (NGN).
public struct NGN: _MoneyUmbrellaProtocol {
  public static var name: String { return "Naira" }
  public static var alphabeticCode: String { return "NGN" }
  public static var numericCode: UInt16 { return 566 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Cordoba Oro (NIO).
public struct NIO: _MoneyUmbrellaProtocol {
  public static var name: String { return "Cordoba Oro" }
  public static var alphabeticCode: String { return "NIO" }
  public static var numericCode: UInt16 { return 558 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Norwegian Krone (NOK).
public struct NOK: _MoneyUmbrellaProtocol {
  public static var name: String { return "Norwegian Krone" }
  public static var alphabeticCode: String { return "NOK" }
  public static var numericCode: UInt16 { return 578 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Nepalese Rupee (NPR).
public struct NPR: _MoneyUmbrellaProtocol {
  public static var name: String { return "Nepalese Rupee" }
  public static var alphabeticCode: String { return "NPR" }
  public static var numericCode: UInt16 { return 524 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The New Zealand Dollar (NZD).
public struct NZD: _MoneyUmbrellaProtocol {
  public static var name: String { return "New Zealand Dollar" }
  public static var alphabeticCode: String { return "NZD" }
  public static var numericCode: UInt16 { return 554 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Rial Omani (OMR).
public struct OMR: _MoneyUmbrellaProtocol {
  public static var name: String { return "Rial Omani" }
  public static var alphabeticCode: String { return "OMR" }
  public static var numericCode: UInt16 { return 512 }
  public static var minorUnits: UInt8 { return 3 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Balboa (PAB).
public struct PAB: _MoneyUmbrellaProtocol {
  public static var name: String { return "Balboa" }
  public static var alphabeticCode: String { return "PAB" }
  public static var numericCode: UInt16 { return 590 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Sol (PEN).
public struct PEN: _MoneyUmbrellaProtocol {
  public static var name: String { return "Sol" }
  public static var alphabeticCode: String { return "PEN" }
  public static var numericCode: UInt16 { return 604 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Kina (PGK).
public struct PGK: _MoneyUmbrellaProtocol {
  public static var name: String { return "Kina" }
  public static var alphabeticCode: String { return "PGK" }
  public static var numericCode: UInt16 { return 598 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Philippine Peso (PHP).
public struct PHP: _MoneyUmbrellaProtocol {
  public static var name: String { return "Philippine Peso" }
  public static var alphabeticCode: String { return "PHP" }
  public static var numericCode: UInt16 { return 608 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Pakistan Rupee (PKR).
public struct PKR: _MoneyUmbrellaProtocol {
  public static var name: String { return "Pakistan Rupee" }
  public static var alphabeticCode: String { return "PKR" }
  public static var numericCode: UInt16 { return 586 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Zloty (PLN).
public struct PLN: _MoneyUmbrellaProtocol {
  public static var name: String { return "Zloty" }
  public static var alphabeticCode: String { return "PLN" }
  public static var numericCode: UInt16 { return 985 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Guarani (PYG).
public struct PYG: _MoneyUmbrellaProtocol {
  public static var name: String { return "Guarani" }
  public static var alphabeticCode: String { return "PYG" }
  public static var numericCode: UInt16 { return 600 }
  public static var minorUnits: UInt8 { return 0 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Qatari Rial (QAR).
public struct QAR: _MoneyUmbrellaProtocol {
  public static var name: String { return "Qatari Rial" }
  public static var alphabeticCode: String { return "QAR" }
  public static var numericCode: UInt16 { return 634 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Romanian Leu (RON).
public struct RON: _MoneyUmbrellaProtocol {
  public static var name: String { return "Romanian Leu" }
  public static var alphabeticCode: String { return "RON" }
  public static var numericCode: UInt16 { return 946 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Serbian Dinar (RSD).
public struct RSD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Serbian Dinar" }
  public static var alphabeticCode: String { return "RSD" }
  public static var numericCode: UInt16 { return 941 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Russian Ruble (RUB).
public struct RUB: _MoneyUmbrellaProtocol {
  public static var name: String { return "Russian Ruble" }
  public static var alphabeticCode: String { return "RUB" }
  public static var numericCode: UInt16 { return 643 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Rwanda Franc (RWF).
public struct RWF: _MoneyUmbrellaProtocol {
  public static var name: String { return "Rwanda Franc" }
  public static var alphabeticCode: String { return "RWF" }
  public static var numericCode: UInt16 { return 646 }
  public static var minorUnits: UInt8 { return 0 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Saudi Riyal (SAR).
public struct SAR: _MoneyUmbrellaProtocol {
  public static var name: String { return "Saudi Riyal" }
  public static var alphabeticCode: String { return "SAR" }
  public static var numericCode: UInt16 { return 682 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Solomon Islands Dollar (SBD).
public struct SBD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Solomon Islands Dollar" }
  public static var alphabeticCode: String { return "SBD" }
  public static var numericCode: UInt16 { return 90 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Seychelles Rupee (SCR).
public struct SCR: _MoneyUmbrellaProtocol {
  public static var name: String { return "Seychelles Rupee" }
  public static var alphabeticCode: String { return "SCR" }
  public static var numericCode: UInt16 { return 690 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Sudanese Pound (SDG).
public struct SDG: _MoneyUmbrellaProtocol {
  public static var name: String { return "Sudanese Pound" }
  public static var alphabeticCode: String { return "SDG" }
  public static var numericCode: UInt16 { return 938 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Swedish Krona (SEK).
public struct SEK: _MoneyUmbrellaProtocol {
  public static var name: String { return "Swedish Krona" }
  public static var alphabeticCode: String { return "SEK" }
  public static var numericCode: UInt16 { return 752 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Singapore Dollar (SGD).
public struct SGD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Singapore Dollar" }
  public static var alphabeticCode: String { return "SGD" }
  public static var numericCode: UInt16 { return 702 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Saint Helena Pound (SHP).
public struct SHP: _MoneyUmbrellaProtocol {
  public static var name: String { return "Saint Helena Pound" }
  public static var alphabeticCode: String { return "SHP" }
  public static var numericCode: UInt16 { return 654 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Leone (SLL).
public struct SLL: _MoneyUmbrellaProtocol {
  public static var name: String { return "Leone" }
  public static var alphabeticCode: String { return "SLL" }
  public static var numericCode: UInt16 { return 694 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Somali Shilling (SOS).
public struct SOS: _MoneyUmbrellaProtocol {
  public static var name: String { return "Somali Shilling" }
  public static var alphabeticCode: String { return "SOS" }
  public static var numericCode: UInt16 { return 706 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Surinam Dollar (SRD).
public struct SRD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Surinam Dollar" }
  public static var alphabeticCode: String { return "SRD" }
  public static var numericCode: UInt16 { return 968 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The South Sudanese Pound (SSP).
public struct SSP: _MoneyUmbrellaProtocol {
  public static var name: String { return "South Sudanese Pound" }
  public static var alphabeticCode: String { return "SSP" }
  public static var numericCode: UInt16 { return 728 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Dobra (STN).
public struct STN: _MoneyUmbrellaProtocol {
  public static var name: String { return "Dobra" }
  public static var alphabeticCode: String { return "STN" }
  public static var numericCode: UInt16 { return 930 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The El Salvador Colon (SVC).
public struct SVC: _MoneyUmbrellaProtocol {
  public static var name: String { return "El Salvador Colon" }
  public static var alphabeticCode: String { return "SVC" }
  public static var numericCode: UInt16 { return 222 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Syrian Pound (SYP).
public struct SYP: _MoneyUmbrellaProtocol {
  public static var name: String { return "Syrian Pound" }
  public static var alphabeticCode: String { return "SYP" }
  public static var numericCode: UInt16 { return 760 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Lilangeni (SZL).
public struct SZL: _MoneyUmbrellaProtocol {
  public static var name: String { return "Lilangeni" }
  public static var alphabeticCode: String { return "SZL" }
  public static var numericCode: UInt16 { return 748 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Baht (THB).
public struct THB: _MoneyUmbrellaProtocol {
  public static var name: String { return "Baht" }
  public static var alphabeticCode: String { return "THB" }
  public static var numericCode: UInt16 { return 764 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Somoni (TJS).
public struct TJS: _MoneyUmbrellaProtocol {
  public static var name: String { return "Somoni" }
  public static var alphabeticCode: String { return "TJS" }
  public static var numericCode: UInt16 { return 972 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Turkmenistan New Manat (TMT).
public struct TMT: _MoneyUmbrellaProtocol {
  public static var name: String { return "Turkmenistan New Manat" }
  public static var alphabeticCode: String { return "TMT" }
  public static var numericCode: UInt16 { return 934 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Tunisian Dinar (TND).
public struct TND: _MoneyUmbrellaProtocol {
  public static var name: String { return "Tunisian Dinar" }
  public static var alphabeticCode: String { return "TND" }
  public static var numericCode: UInt16 { return 788 }
  public static var minorUnits: UInt8 { return 3 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Pa’anga (TOP).
public struct TOP: _MoneyUmbrellaProtocol {
  public static var name: String { return "Pa’anga" }
  public static var alphabeticCode: String { return "TOP" }
  public static var numericCode: UInt16 { return 776 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Turkish Lira (TRY).
public struct TRY: _MoneyUmbrellaProtocol {
  public static var name: String { return "Turkish Lira" }
  public static var alphabeticCode: String { return "TRY" }
  public static var numericCode: UInt16 { return 949 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Trinidad and Tobago Dollar (TTD).
public struct TTD: _MoneyUmbrellaProtocol {
  public static var name: String { return "Trinidad and Tobago Dollar" }
  public static var alphabeticCode: String { return "TTD" }
  public static var numericCode: UInt16 { return 780 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The New Taiwan Dollar (TWD).
public struct TWD: _MoneyUmbrellaProtocol {
  public static var name: String { return "New Taiwan Dollar" }
  public static var alphabeticCode: String { return "TWD" }
  public static var numericCode: UInt16 { return 901 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Tanzanian Shilling (TZS).
public struct TZS: _MoneyUmbrellaProtocol {
  public static var name: String { return "Tanzanian Shilling" }
  public static var alphabeticCode: String { return "TZS" }
  public static var numericCode: UInt16 { return 834 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Hryvnia (UAH).
public struct UAH: _MoneyUmbrellaProtocol {
  public static var name: String { return "Hryvnia" }
  public static var alphabeticCode: String { return "UAH" }
  public static var numericCode: UInt16 { return 980 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Uganda Shilling (UGX).
public struct UGX: _MoneyUmbrellaProtocol {
  public static var name: String { return "Uganda Shilling" }
  public static var alphabeticCode: String { return "UGX" }
  public static var numericCode: UInt16 { return 800 }
  public static var minorUnits: UInt8 { return 0 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The US Dollar (USD).
public struct USD: _MoneyUmbrellaProtocol {
  public static var name: String { return "US Dollar" }
  public static var alphabeticCode: String { return "USD" }
  public static var numericCode: UInt16 { return 840 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Peso Uruguayo (UYU).
public struct UYU: _MoneyUmbrellaProtocol {
  public static var name: String { return "Peso Uruguayo" }
  public static var alphabeticCode: String { return "UYU" }
  public static var numericCode: UInt16 { return 858 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Unidad Previsional (UYW).
public struct UYW: _MoneyUmbrellaProtocol {
  public static var name: String { return "Unidad Previsional" }
  public static var alphabeticCode: String { return "UYW" }
  public static var numericCode: UInt16 { return 927 }
  public static var minorUnits: UInt8 { return 4 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Uzbekistan Sum (UZS).
public struct UZS: _MoneyUmbrellaProtocol {
  public static var name: String { return "Uzbekistan Sum" }
  public static var alphabeticCode: String { return "UZS" }
  public static var numericCode: UInt16 { return 860 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Bolívar Soberano (VES).
public struct VES: _MoneyUmbrellaProtocol {
  public static var name: String { return "Bolívar Soberano" }
  public static var alphabeticCode: String { return "VES" }
  public static var numericCode: UInt16 { return 928 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Dong (VND).
public struct VND: _MoneyUmbrellaProtocol {
  public static var name: String { return "Dong" }
  public static var alphabeticCode: String { return "VND" }
  public static var numericCode: UInt16 { return 704 }
  public static var minorUnits: UInt8 { return 0 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Vatu (VUV).
public struct VUV: _MoneyUmbrellaProtocol {
  public static var name: String { return "Vatu" }
  public static var alphabeticCode: String { return "VUV" }
  public static var numericCode: UInt16 { return 548 }
  public static var minorUnits: UInt8 { return 0 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Tala (WST).
public struct WST: _MoneyUmbrellaProtocol {
  public static var name: String { return "Tala" }
  public static var alphabeticCode: String { return "WST" }
  public static var numericCode: UInt16 { return 882 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The CFA Franc BEAC (XAF).
public struct XAF: _MoneyUmbrellaProtocol {
  public static var name: String { return "CFA Franc BEAC" }
  public static var alphabeticCode: String { return "XAF" }
  public static var numericCode: UInt16 { return 950 }
  public static var minorUnits: UInt8 { return 0 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The East Caribbean Dollar (XCD).
public struct XCD: _MoneyUmbrellaProtocol {
  public static var name: String { return "East Caribbean Dollar" }
  public static var alphabeticCode: String { return "XCD" }
  public static var numericCode: UInt16 { return 951 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The CFA Franc BCEAO (XOF).
public struct XOF: _MoneyUmbrellaProtocol {
  public static var name: String { return "CFA Franc BCEAO" }
  public static var alphabeticCode: String { return "XOF" }
  public static var numericCode: UInt16 { return 952 }
  public static var minorUnits: UInt8 { return 0 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The CFP Franc (XPF).
public struct XPF: _MoneyUmbrellaProtocol {
  public static var name: String { return "CFP Franc" }
  public static var alphabeticCode: String { return "XPF" }
  public static var numericCode: UInt16 { return 953 }
  public static var minorUnits: UInt8 { return 0 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Yemeni Rial (YER).
public struct YER: _MoneyUmbrellaProtocol {
  public static var name: String { return "Yemeni Rial" }
  public static var alphabeticCode: String { return "YER" }
  public static var numericCode: UInt16 { return 886 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Rand (ZAR).
public struct ZAR: _MoneyUmbrellaProtocol {
  public static var name: String { return "Rand" }
  public static var alphabeticCode: String { return "ZAR" }
  public static var numericCode: UInt16 { return 710 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Zambian Kwacha (ZMW).
public struct ZMW: _MoneyUmbrellaProtocol {
  public static var name: String { return "Zambian Kwacha" }
  public static var alphabeticCode: String { return "ZMW" }
  public static var numericCode: UInt16 { return 967 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

/// The Zimbabwe Dollar (ZWL).
public struct ZWL: _MoneyUmbrellaProtocol {
  public static var name: String { return "Zimbabwe Dollar" }
  public static var alphabeticCode: String { return "ZWL" }
  public static var numericCode: UInt16 { return 932 }
  public static var minorUnits: UInt8 { return 2 }
  
  public var rawAmount: Decimal { return self._rawAmount }
  
  public init(_ amount: Decimal) { self._rawAmount = amount }
  
  private let _rawAmount: Decimal
}

