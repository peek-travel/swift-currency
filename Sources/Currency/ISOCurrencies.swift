//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftCurrency open source project
//
// Copyright (c) 2020 SwiftCurrency project authors
// Licensed under MIT License
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftCurrency project authors
//
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

// Contents following this line are automatically generated, and should not be edited.

import Foundation

/// A currency that is defined by the ISO 4217 standard.
///
/// Any conforming type acts as both the storage and definition of a given currency it represents.
public protocol ISOCurrency: CurrencyRepresentableAsMinorUnits, CurrencyMetadata { }

/// The UAE Dirham (AED) currency, as defined by ISO 4217.
public struct AED: ISOCurrency {
  public static var name: String { return "UAE Dirham" }
  public static var alphabeticCode: String { return "AED" }
  public static var numericCode: UInt16 { return 784 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Afghani (AFN) currency, as defined by ISO 4217.
public struct AFN: ISOCurrency {
  public static var name: String { return "Afghani" }
  public static var alphabeticCode: String { return "AFN" }
  public static var numericCode: UInt16 { return 971 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Lek (ALL) currency, as defined by ISO 4217.
public struct ALL: ISOCurrency {
  public static var name: String { return "Lek" }
  public static var alphabeticCode: String { return "ALL" }
  public static var numericCode: UInt16 { return 8 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Armenian Dram (AMD) currency, as defined by ISO 4217.
public struct AMD: ISOCurrency {
  public static var name: String { return "Armenian Dram" }
  public static var alphabeticCode: String { return "AMD" }
  public static var numericCode: UInt16 { return 51 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Netherlands Antillean Guilder (ANG) currency, as defined by ISO 4217.
public struct ANG: ISOCurrency {
  public static var name: String { return "Netherlands Antillean Guilder" }
  public static var alphabeticCode: String { return "ANG" }
  public static var numericCode: UInt16 { return 532 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Kwanza (AOA) currency, as defined by ISO 4217.
public struct AOA: ISOCurrency {
  public static var name: String { return "Kwanza" }
  public static var alphabeticCode: String { return "AOA" }
  public static var numericCode: UInt16 { return 973 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Argentine Peso (ARS) currency, as defined by ISO 4217.
public struct ARS: ISOCurrency {
  public static var name: String { return "Argentine Peso" }
  public static var alphabeticCode: String { return "ARS" }
  public static var numericCode: UInt16 { return 32 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Australian Dollar (AUD) currency, as defined by ISO 4217.
public struct AUD: ISOCurrency {
  public static var name: String { return "Australian Dollar" }
  public static var alphabeticCode: String { return "AUD" }
  public static var numericCode: UInt16 { return 36 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Aruban Florin (AWG) currency, as defined by ISO 4217.
public struct AWG: ISOCurrency {
  public static var name: String { return "Aruban Florin" }
  public static var alphabeticCode: String { return "AWG" }
  public static var numericCode: UInt16 { return 533 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Azerbaijan Manat (AZN) currency, as defined by ISO 4217.
public struct AZN: ISOCurrency {
  public static var name: String { return "Azerbaijan Manat" }
  public static var alphabeticCode: String { return "AZN" }
  public static var numericCode: UInt16 { return 944 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Convertible Mark (BAM) currency, as defined by ISO 4217.
public struct BAM: ISOCurrency {
  public static var name: String { return "Convertible Mark" }
  public static var alphabeticCode: String { return "BAM" }
  public static var numericCode: UInt16 { return 977 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Barbados Dollar (BBD) currency, as defined by ISO 4217.
public struct BBD: ISOCurrency {
  public static var name: String { return "Barbados Dollar" }
  public static var alphabeticCode: String { return "BBD" }
  public static var numericCode: UInt16 { return 52 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Taka (BDT) currency, as defined by ISO 4217.
public struct BDT: ISOCurrency {
  public static var name: String { return "Taka" }
  public static var alphabeticCode: String { return "BDT" }
  public static var numericCode: UInt16 { return 50 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Bulgarian Lev (BGN) currency, as defined by ISO 4217.
public struct BGN: ISOCurrency {
  public static var name: String { return "Bulgarian Lev" }
  public static var alphabeticCode: String { return "BGN" }
  public static var numericCode: UInt16 { return 975 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Bahraini Dinar (BHD) currency, as defined by ISO 4217.
public struct BHD: ISOCurrency {
  public static var name: String { return "Bahraini Dinar" }
  public static var alphabeticCode: String { return "BHD" }
  public static var numericCode: UInt16 { return 48 }
  public static var minorUnits: UInt8 { return 3 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Burundi Franc (BIF) currency, as defined by ISO 4217.
public struct BIF: ISOCurrency {
  public static var name: String { return "Burundi Franc" }
  public static var alphabeticCode: String { return "BIF" }
  public static var numericCode: UInt16 { return 108 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Bermudian Dollar (BMD) currency, as defined by ISO 4217.
public struct BMD: ISOCurrency {
  public static var name: String { return "Bermudian Dollar" }
  public static var alphabeticCode: String { return "BMD" }
  public static var numericCode: UInt16 { return 60 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Brunei Dollar (BND) currency, as defined by ISO 4217.
public struct BND: ISOCurrency {
  public static var name: String { return "Brunei Dollar" }
  public static var alphabeticCode: String { return "BND" }
  public static var numericCode: UInt16 { return 96 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Boliviano (BOB) currency, as defined by ISO 4217.
public struct BOB: ISOCurrency {
  public static var name: String { return "Boliviano" }
  public static var alphabeticCode: String { return "BOB" }
  public static var numericCode: UInt16 { return 68 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Brazilian Real (BRL) currency, as defined by ISO 4217.
public struct BRL: ISOCurrency {
  public static var name: String { return "Brazilian Real" }
  public static var alphabeticCode: String { return "BRL" }
  public static var numericCode: UInt16 { return 986 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Bahamian Dollar (BSD) currency, as defined by ISO 4217.
public struct BSD: ISOCurrency {
  public static var name: String { return "Bahamian Dollar" }
  public static var alphabeticCode: String { return "BSD" }
  public static var numericCode: UInt16 { return 44 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Ngultrum (BTN) currency, as defined by ISO 4217.
public struct BTN: ISOCurrency {
  public static var name: String { return "Ngultrum" }
  public static var alphabeticCode: String { return "BTN" }
  public static var numericCode: UInt16 { return 64 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Pula (BWP) currency, as defined by ISO 4217.
public struct BWP: ISOCurrency {
  public static var name: String { return "Pula" }
  public static var alphabeticCode: String { return "BWP" }
  public static var numericCode: UInt16 { return 72 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Belarusian Ruble (BYN) currency, as defined by ISO 4217.
public struct BYN: ISOCurrency {
  public static var name: String { return "Belarusian Ruble" }
  public static var alphabeticCode: String { return "BYN" }
  public static var numericCode: UInt16 { return 933 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Belize Dollar (BZD) currency, as defined by ISO 4217.
public struct BZD: ISOCurrency {
  public static var name: String { return "Belize Dollar" }
  public static var alphabeticCode: String { return "BZD" }
  public static var numericCode: UInt16 { return 84 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Canadian Dollar (CAD) currency, as defined by ISO 4217.
public struct CAD: ISOCurrency {
  public static var name: String { return "Canadian Dollar" }
  public static var alphabeticCode: String { return "CAD" }
  public static var numericCode: UInt16 { return 124 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Congolese Franc (CDF) currency, as defined by ISO 4217.
public struct CDF: ISOCurrency {
  public static var name: String { return "Congolese Franc" }
  public static var alphabeticCode: String { return "CDF" }
  public static var numericCode: UInt16 { return 976 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Swiss Franc (CHF) currency, as defined by ISO 4217.
public struct CHF: ISOCurrency {
  public static var name: String { return "Swiss Franc" }
  public static var alphabeticCode: String { return "CHF" }
  public static var numericCode: UInt16 { return 756 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Chilean Peso (CLP) currency, as defined by ISO 4217.
public struct CLP: ISOCurrency {
  public static var name: String { return "Chilean Peso" }
  public static var alphabeticCode: String { return "CLP" }
  public static var numericCode: UInt16 { return 152 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Yuan Renminbi (CNY) currency, as defined by ISO 4217.
public struct CNY: ISOCurrency {
  public static var name: String { return "Yuan Renminbi" }
  public static var alphabeticCode: String { return "CNY" }
  public static var numericCode: UInt16 { return 156 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Colombian Peso (COP) currency, as defined by ISO 4217.
public struct COP: ISOCurrency {
  public static var name: String { return "Colombian Peso" }
  public static var alphabeticCode: String { return "COP" }
  public static var numericCode: UInt16 { return 170 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Costa Rican Colon (CRC) currency, as defined by ISO 4217.
public struct CRC: ISOCurrency {
  public static var name: String { return "Costa Rican Colon" }
  public static var alphabeticCode: String { return "CRC" }
  public static var numericCode: UInt16 { return 188 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Peso Convertible (CUC) currency, as defined by ISO 4217.
public struct CUC: ISOCurrency {
  public static var name: String { return "Peso Convertible" }
  public static var alphabeticCode: String { return "CUC" }
  public static var numericCode: UInt16 { return 931 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Cuban Peso (CUP) currency, as defined by ISO 4217.
public struct CUP: ISOCurrency {
  public static var name: String { return "Cuban Peso" }
  public static var alphabeticCode: String { return "CUP" }
  public static var numericCode: UInt16 { return 192 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Cabo Verde Escudo (CVE) currency, as defined by ISO 4217.
public struct CVE: ISOCurrency {
  public static var name: String { return "Cabo Verde Escudo" }
  public static var alphabeticCode: String { return "CVE" }
  public static var numericCode: UInt16 { return 132 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Czech Koruna (CZK) currency, as defined by ISO 4217.
public struct CZK: ISOCurrency {
  public static var name: String { return "Czech Koruna" }
  public static var alphabeticCode: String { return "CZK" }
  public static var numericCode: UInt16 { return 203 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Djibouti Franc (DJF) currency, as defined by ISO 4217.
public struct DJF: ISOCurrency {
  public static var name: String { return "Djibouti Franc" }
  public static var alphabeticCode: String { return "DJF" }
  public static var numericCode: UInt16 { return 262 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Danish Krone (DKK) currency, as defined by ISO 4217.
public struct DKK: ISOCurrency {
  public static var name: String { return "Danish Krone" }
  public static var alphabeticCode: String { return "DKK" }
  public static var numericCode: UInt16 { return 208 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Dominican Peso (DOP) currency, as defined by ISO 4217.
public struct DOP: ISOCurrency {
  public static var name: String { return "Dominican Peso" }
  public static var alphabeticCode: String { return "DOP" }
  public static var numericCode: UInt16 { return 214 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Algerian Dinar (DZD) currency, as defined by ISO 4217.
public struct DZD: ISOCurrency {
  public static var name: String { return "Algerian Dinar" }
  public static var alphabeticCode: String { return "DZD" }
  public static var numericCode: UInt16 { return 12 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Egyptian Pound (EGP) currency, as defined by ISO 4217.
public struct EGP: ISOCurrency {
  public static var name: String { return "Egyptian Pound" }
  public static var alphabeticCode: String { return "EGP" }
  public static var numericCode: UInt16 { return 818 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Nakfa (ERN) currency, as defined by ISO 4217.
public struct ERN: ISOCurrency {
  public static var name: String { return "Nakfa" }
  public static var alphabeticCode: String { return "ERN" }
  public static var numericCode: UInt16 { return 232 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Ethiopian Birr (ETB) currency, as defined by ISO 4217.
public struct ETB: ISOCurrency {
  public static var name: String { return "Ethiopian Birr" }
  public static var alphabeticCode: String { return "ETB" }
  public static var numericCode: UInt16 { return 230 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Euro (EUR) currency, as defined by ISO 4217.
public struct EUR: ISOCurrency {
  public static var name: String { return "Euro" }
  public static var alphabeticCode: String { return "EUR" }
  public static var numericCode: UInt16 { return 978 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Fiji Dollar (FJD) currency, as defined by ISO 4217.
public struct FJD: ISOCurrency {
  public static var name: String { return "Fiji Dollar" }
  public static var alphabeticCode: String { return "FJD" }
  public static var numericCode: UInt16 { return 242 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Falkland Islands Pound (FKP) currency, as defined by ISO 4217.
public struct FKP: ISOCurrency {
  public static var name: String { return "Falkland Islands Pound" }
  public static var alphabeticCode: String { return "FKP" }
  public static var numericCode: UInt16 { return 238 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Pound Sterling (GBP) currency, as defined by ISO 4217.
public struct GBP: ISOCurrency {
  public static var name: String { return "Pound Sterling" }
  public static var alphabeticCode: String { return "GBP" }
  public static var numericCode: UInt16 { return 826 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Lari (GEL) currency, as defined by ISO 4217.
public struct GEL: ISOCurrency {
  public static var name: String { return "Lari" }
  public static var alphabeticCode: String { return "GEL" }
  public static var numericCode: UInt16 { return 981 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Ghana Cedi (GHS) currency, as defined by ISO 4217.
public struct GHS: ISOCurrency {
  public static var name: String { return "Ghana Cedi" }
  public static var alphabeticCode: String { return "GHS" }
  public static var numericCode: UInt16 { return 936 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Gibraltar Pound (GIP) currency, as defined by ISO 4217.
public struct GIP: ISOCurrency {
  public static var name: String { return "Gibraltar Pound" }
  public static var alphabeticCode: String { return "GIP" }
  public static var numericCode: UInt16 { return 292 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Dalasi (GMD) currency, as defined by ISO 4217.
public struct GMD: ISOCurrency {
  public static var name: String { return "Dalasi" }
  public static var alphabeticCode: String { return "GMD" }
  public static var numericCode: UInt16 { return 270 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Guinean Franc (GNF) currency, as defined by ISO 4217.
public struct GNF: ISOCurrency {
  public static var name: String { return "Guinean Franc" }
  public static var alphabeticCode: String { return "GNF" }
  public static var numericCode: UInt16 { return 324 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Quetzal (GTQ) currency, as defined by ISO 4217.
public struct GTQ: ISOCurrency {
  public static var name: String { return "Quetzal" }
  public static var alphabeticCode: String { return "GTQ" }
  public static var numericCode: UInt16 { return 320 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Guyana Dollar (GYD) currency, as defined by ISO 4217.
public struct GYD: ISOCurrency {
  public static var name: String { return "Guyana Dollar" }
  public static var alphabeticCode: String { return "GYD" }
  public static var numericCode: UInt16 { return 328 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Hong Kong Dollar (HKD) currency, as defined by ISO 4217.
public struct HKD: ISOCurrency {
  public static var name: String { return "Hong Kong Dollar" }
  public static var alphabeticCode: String { return "HKD" }
  public static var numericCode: UInt16 { return 344 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Lempira (HNL) currency, as defined by ISO 4217.
public struct HNL: ISOCurrency {
  public static var name: String { return "Lempira" }
  public static var alphabeticCode: String { return "HNL" }
  public static var numericCode: UInt16 { return 340 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Kuna (HRK) currency, as defined by ISO 4217.
public struct HRK: ISOCurrency {
  public static var name: String { return "Kuna" }
  public static var alphabeticCode: String { return "HRK" }
  public static var numericCode: UInt16 { return 191 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Gourde (HTG) currency, as defined by ISO 4217.
public struct HTG: ISOCurrency {
  public static var name: String { return "Gourde" }
  public static var alphabeticCode: String { return "HTG" }
  public static var numericCode: UInt16 { return 332 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Forint (HUF) currency, as defined by ISO 4217.
public struct HUF: ISOCurrency {
  public static var name: String { return "Forint" }
  public static var alphabeticCode: String { return "HUF" }
  public static var numericCode: UInt16 { return 348 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Rupiah (IDR) currency, as defined by ISO 4217.
public struct IDR: ISOCurrency {
  public static var name: String { return "Rupiah" }
  public static var alphabeticCode: String { return "IDR" }
  public static var numericCode: UInt16 { return 360 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The New Israeli Sheqel (ILS) currency, as defined by ISO 4217.
public struct ILS: ISOCurrency {
  public static var name: String { return "New Israeli Sheqel" }
  public static var alphabeticCode: String { return "ILS" }
  public static var numericCode: UInt16 { return 376 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Indian Rupee (INR) currency, as defined by ISO 4217.
public struct INR: ISOCurrency {
  public static var name: String { return "Indian Rupee" }
  public static var alphabeticCode: String { return "INR" }
  public static var numericCode: UInt16 { return 356 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Iraqi Dinar (IQD) currency, as defined by ISO 4217.
public struct IQD: ISOCurrency {
  public static var name: String { return "Iraqi Dinar" }
  public static var alphabeticCode: String { return "IQD" }
  public static var numericCode: UInt16 { return 368 }
  public static var minorUnits: UInt8 { return 3 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Iranian Rial (IRR) currency, as defined by ISO 4217.
public struct IRR: ISOCurrency {
  public static var name: String { return "Iranian Rial" }
  public static var alphabeticCode: String { return "IRR" }
  public static var numericCode: UInt16 { return 364 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Iceland Krona (ISK) currency, as defined by ISO 4217.
public struct ISK: ISOCurrency {
  public static var name: String { return "Iceland Krona" }
  public static var alphabeticCode: String { return "ISK" }
  public static var numericCode: UInt16 { return 352 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Jamaican Dollar (JMD) currency, as defined by ISO 4217.
public struct JMD: ISOCurrency {
  public static var name: String { return "Jamaican Dollar" }
  public static var alphabeticCode: String { return "JMD" }
  public static var numericCode: UInt16 { return 388 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Jordanian Dinar (JOD) currency, as defined by ISO 4217.
public struct JOD: ISOCurrency {
  public static var name: String { return "Jordanian Dinar" }
  public static var alphabeticCode: String { return "JOD" }
  public static var numericCode: UInt16 { return 400 }
  public static var minorUnits: UInt8 { return 3 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Yen (JPY) currency, as defined by ISO 4217.
public struct JPY: ISOCurrency {
  public static var name: String { return "Yen" }
  public static var alphabeticCode: String { return "JPY" }
  public static var numericCode: UInt16 { return 392 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Kenyan Shilling (KES) currency, as defined by ISO 4217.
public struct KES: ISOCurrency {
  public static var name: String { return "Kenyan Shilling" }
  public static var alphabeticCode: String { return "KES" }
  public static var numericCode: UInt16 { return 404 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Som (KGS) currency, as defined by ISO 4217.
public struct KGS: ISOCurrency {
  public static var name: String { return "Som" }
  public static var alphabeticCode: String { return "KGS" }
  public static var numericCode: UInt16 { return 417 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Riel (KHR) currency, as defined by ISO 4217.
public struct KHR: ISOCurrency {
  public static var name: String { return "Riel" }
  public static var alphabeticCode: String { return "KHR" }
  public static var numericCode: UInt16 { return 116 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Comorian Franc (KMF) currency, as defined by ISO 4217.
public struct KMF: ISOCurrency {
  public static var name: String { return "Comorian Franc" }
  public static var alphabeticCode: String { return "KMF" }
  public static var numericCode: UInt16 { return 174 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The North Korean Won (KPW) currency, as defined by ISO 4217.
public struct KPW: ISOCurrency {
  public static var name: String { return "North Korean Won" }
  public static var alphabeticCode: String { return "KPW" }
  public static var numericCode: UInt16 { return 408 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Won (KRW) currency, as defined by ISO 4217.
public struct KRW: ISOCurrency {
  public static var name: String { return "Won" }
  public static var alphabeticCode: String { return "KRW" }
  public static var numericCode: UInt16 { return 410 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Kuwaiti Dinar (KWD) currency, as defined by ISO 4217.
public struct KWD: ISOCurrency {
  public static var name: String { return "Kuwaiti Dinar" }
  public static var alphabeticCode: String { return "KWD" }
  public static var numericCode: UInt16 { return 414 }
  public static var minorUnits: UInt8 { return 3 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Cayman Islands Dollar (KYD) currency, as defined by ISO 4217.
public struct KYD: ISOCurrency {
  public static var name: String { return "Cayman Islands Dollar" }
  public static var alphabeticCode: String { return "KYD" }
  public static var numericCode: UInt16 { return 136 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Tenge (KZT) currency, as defined by ISO 4217.
public struct KZT: ISOCurrency {
  public static var name: String { return "Tenge" }
  public static var alphabeticCode: String { return "KZT" }
  public static var numericCode: UInt16 { return 398 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Lao Kip (LAK) currency, as defined by ISO 4217.
public struct LAK: ISOCurrency {
  public static var name: String { return "Lao Kip" }
  public static var alphabeticCode: String { return "LAK" }
  public static var numericCode: UInt16 { return 418 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Lebanese Pound (LBP) currency, as defined by ISO 4217.
public struct LBP: ISOCurrency {
  public static var name: String { return "Lebanese Pound" }
  public static var alphabeticCode: String { return "LBP" }
  public static var numericCode: UInt16 { return 422 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Sri Lanka Rupee (LKR) currency, as defined by ISO 4217.
public struct LKR: ISOCurrency {
  public static var name: String { return "Sri Lanka Rupee" }
  public static var alphabeticCode: String { return "LKR" }
  public static var numericCode: UInt16 { return 144 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Liberian Dollar (LRD) currency, as defined by ISO 4217.
public struct LRD: ISOCurrency {
  public static var name: String { return "Liberian Dollar" }
  public static var alphabeticCode: String { return "LRD" }
  public static var numericCode: UInt16 { return 430 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Loti (LSL) currency, as defined by ISO 4217.
public struct LSL: ISOCurrency {
  public static var name: String { return "Loti" }
  public static var alphabeticCode: String { return "LSL" }
  public static var numericCode: UInt16 { return 426 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Libyan Dinar (LYD) currency, as defined by ISO 4217.
public struct LYD: ISOCurrency {
  public static var name: String { return "Libyan Dinar" }
  public static var alphabeticCode: String { return "LYD" }
  public static var numericCode: UInt16 { return 434 }
  public static var minorUnits: UInt8 { return 3 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Moroccan Dirham (MAD) currency, as defined by ISO 4217.
public struct MAD: ISOCurrency {
  public static var name: String { return "Moroccan Dirham" }
  public static var alphabeticCode: String { return "MAD" }
  public static var numericCode: UInt16 { return 504 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Moldovan Leu (MDL) currency, as defined by ISO 4217.
public struct MDL: ISOCurrency {
  public static var name: String { return "Moldovan Leu" }
  public static var alphabeticCode: String { return "MDL" }
  public static var numericCode: UInt16 { return 498 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Malagasy Ariary (MGA) currency, as defined by ISO 4217.
public struct MGA: ISOCurrency {
  public static var name: String { return "Malagasy Ariary" }
  public static var alphabeticCode: String { return "MGA" }
  public static var numericCode: UInt16 { return 969 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Denar (MKD) currency, as defined by ISO 4217.
public struct MKD: ISOCurrency {
  public static var name: String { return "Denar" }
  public static var alphabeticCode: String { return "MKD" }
  public static var numericCode: UInt16 { return 807 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Kyat (MMK) currency, as defined by ISO 4217.
public struct MMK: ISOCurrency {
  public static var name: String { return "Kyat" }
  public static var alphabeticCode: String { return "MMK" }
  public static var numericCode: UInt16 { return 104 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Tugrik (MNT) currency, as defined by ISO 4217.
public struct MNT: ISOCurrency {
  public static var name: String { return "Tugrik" }
  public static var alphabeticCode: String { return "MNT" }
  public static var numericCode: UInt16 { return 496 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Pataca (MOP) currency, as defined by ISO 4217.
public struct MOP: ISOCurrency {
  public static var name: String { return "Pataca" }
  public static var alphabeticCode: String { return "MOP" }
  public static var numericCode: UInt16 { return 446 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Ouguiya (MRU) currency, as defined by ISO 4217.
public struct MRU: ISOCurrency {
  public static var name: String { return "Ouguiya" }
  public static var alphabeticCode: String { return "MRU" }
  public static var numericCode: UInt16 { return 929 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Mauritius Rupee (MUR) currency, as defined by ISO 4217.
public struct MUR: ISOCurrency {
  public static var name: String { return "Mauritius Rupee" }
  public static var alphabeticCode: String { return "MUR" }
  public static var numericCode: UInt16 { return 480 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Rufiyaa (MVR) currency, as defined by ISO 4217.
public struct MVR: ISOCurrency {
  public static var name: String { return "Rufiyaa" }
  public static var alphabeticCode: String { return "MVR" }
  public static var numericCode: UInt16 { return 462 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Malawi Kwacha (MWK) currency, as defined by ISO 4217.
public struct MWK: ISOCurrency {
  public static var name: String { return "Malawi Kwacha" }
  public static var alphabeticCode: String { return "MWK" }
  public static var numericCode: UInt16 { return 454 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Mexican Peso (MXN) currency, as defined by ISO 4217.
public struct MXN: ISOCurrency {
  public static var name: String { return "Mexican Peso" }
  public static var alphabeticCode: String { return "MXN" }
  public static var numericCode: UInt16 { return 484 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Malaysian Ringgit (MYR) currency, as defined by ISO 4217.
public struct MYR: ISOCurrency {
  public static var name: String { return "Malaysian Ringgit" }
  public static var alphabeticCode: String { return "MYR" }
  public static var numericCode: UInt16 { return 458 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Mozambique Metical (MZN) currency, as defined by ISO 4217.
public struct MZN: ISOCurrency {
  public static var name: String { return "Mozambique Metical" }
  public static var alphabeticCode: String { return "MZN" }
  public static var numericCode: UInt16 { return 943 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Namibia Dollar (NAD) currency, as defined by ISO 4217.
public struct NAD: ISOCurrency {
  public static var name: String { return "Namibia Dollar" }
  public static var alphabeticCode: String { return "NAD" }
  public static var numericCode: UInt16 { return 516 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Naira (NGN) currency, as defined by ISO 4217.
public struct NGN: ISOCurrency {
  public static var name: String { return "Naira" }
  public static var alphabeticCode: String { return "NGN" }
  public static var numericCode: UInt16 { return 566 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Cordoba Oro (NIO) currency, as defined by ISO 4217.
public struct NIO: ISOCurrency {
  public static var name: String { return "Cordoba Oro" }
  public static var alphabeticCode: String { return "NIO" }
  public static var numericCode: UInt16 { return 558 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Norwegian Krone (NOK) currency, as defined by ISO 4217.
public struct NOK: ISOCurrency {
  public static var name: String { return "Norwegian Krone" }
  public static var alphabeticCode: String { return "NOK" }
  public static var numericCode: UInt16 { return 578 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Nepalese Rupee (NPR) currency, as defined by ISO 4217.
public struct NPR: ISOCurrency {
  public static var name: String { return "Nepalese Rupee" }
  public static var alphabeticCode: String { return "NPR" }
  public static var numericCode: UInt16 { return 524 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The New Zealand Dollar (NZD) currency, as defined by ISO 4217.
public struct NZD: ISOCurrency {
  public static var name: String { return "New Zealand Dollar" }
  public static var alphabeticCode: String { return "NZD" }
  public static var numericCode: UInt16 { return 554 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Rial Omani (OMR) currency, as defined by ISO 4217.
public struct OMR: ISOCurrency {
  public static var name: String { return "Rial Omani" }
  public static var alphabeticCode: String { return "OMR" }
  public static var numericCode: UInt16 { return 512 }
  public static var minorUnits: UInt8 { return 3 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Balboa (PAB) currency, as defined by ISO 4217.
public struct PAB: ISOCurrency {
  public static var name: String { return "Balboa" }
  public static var alphabeticCode: String { return "PAB" }
  public static var numericCode: UInt16 { return 590 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Sol (PEN) currency, as defined by ISO 4217.
public struct PEN: ISOCurrency {
  public static var name: String { return "Sol" }
  public static var alphabeticCode: String { return "PEN" }
  public static var numericCode: UInt16 { return 604 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Kina (PGK) currency, as defined by ISO 4217.
public struct PGK: ISOCurrency {
  public static var name: String { return "Kina" }
  public static var alphabeticCode: String { return "PGK" }
  public static var numericCode: UInt16 { return 598 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Philippine Peso (PHP) currency, as defined by ISO 4217.
public struct PHP: ISOCurrency {
  public static var name: String { return "Philippine Peso" }
  public static var alphabeticCode: String { return "PHP" }
  public static var numericCode: UInt16 { return 608 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Pakistan Rupee (PKR) currency, as defined by ISO 4217.
public struct PKR: ISOCurrency {
  public static var name: String { return "Pakistan Rupee" }
  public static var alphabeticCode: String { return "PKR" }
  public static var numericCode: UInt16 { return 586 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Zloty (PLN) currency, as defined by ISO 4217.
public struct PLN: ISOCurrency {
  public static var name: String { return "Zloty" }
  public static var alphabeticCode: String { return "PLN" }
  public static var numericCode: UInt16 { return 985 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Guarani (PYG) currency, as defined by ISO 4217.
public struct PYG: ISOCurrency {
  public static var name: String { return "Guarani" }
  public static var alphabeticCode: String { return "PYG" }
  public static var numericCode: UInt16 { return 600 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Qatari Rial (QAR) currency, as defined by ISO 4217.
public struct QAR: ISOCurrency {
  public static var name: String { return "Qatari Rial" }
  public static var alphabeticCode: String { return "QAR" }
  public static var numericCode: UInt16 { return 634 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Romanian Leu (RON) currency, as defined by ISO 4217.
public struct RON: ISOCurrency {
  public static var name: String { return "Romanian Leu" }
  public static var alphabeticCode: String { return "RON" }
  public static var numericCode: UInt16 { return 946 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Serbian Dinar (RSD) currency, as defined by ISO 4217.
public struct RSD: ISOCurrency {
  public static var name: String { return "Serbian Dinar" }
  public static var alphabeticCode: String { return "RSD" }
  public static var numericCode: UInt16 { return 941 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Russian Ruble (RUB) currency, as defined by ISO 4217.
public struct RUB: ISOCurrency {
  public static var name: String { return "Russian Ruble" }
  public static var alphabeticCode: String { return "RUB" }
  public static var numericCode: UInt16 { return 643 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Rwanda Franc (RWF) currency, as defined by ISO 4217.
public struct RWF: ISOCurrency {
  public static var name: String { return "Rwanda Franc" }
  public static var alphabeticCode: String { return "RWF" }
  public static var numericCode: UInt16 { return 646 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Saudi Riyal (SAR) currency, as defined by ISO 4217.
public struct SAR: ISOCurrency {
  public static var name: String { return "Saudi Riyal" }
  public static var alphabeticCode: String { return "SAR" }
  public static var numericCode: UInt16 { return 682 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Solomon Islands Dollar (SBD) currency, as defined by ISO 4217.
public struct SBD: ISOCurrency {
  public static var name: String { return "Solomon Islands Dollar" }
  public static var alphabeticCode: String { return "SBD" }
  public static var numericCode: UInt16 { return 90 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Seychelles Rupee (SCR) currency, as defined by ISO 4217.
public struct SCR: ISOCurrency {
  public static var name: String { return "Seychelles Rupee" }
  public static var alphabeticCode: String { return "SCR" }
  public static var numericCode: UInt16 { return 690 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Sudanese Pound (SDG) currency, as defined by ISO 4217.
public struct SDG: ISOCurrency {
  public static var name: String { return "Sudanese Pound" }
  public static var alphabeticCode: String { return "SDG" }
  public static var numericCode: UInt16 { return 938 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Swedish Krona (SEK) currency, as defined by ISO 4217.
public struct SEK: ISOCurrency {
  public static var name: String { return "Swedish Krona" }
  public static var alphabeticCode: String { return "SEK" }
  public static var numericCode: UInt16 { return 752 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Singapore Dollar (SGD) currency, as defined by ISO 4217.
public struct SGD: ISOCurrency {
  public static var name: String { return "Singapore Dollar" }
  public static var alphabeticCode: String { return "SGD" }
  public static var numericCode: UInt16 { return 702 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Saint Helena Pound (SHP) currency, as defined by ISO 4217.
public struct SHP: ISOCurrency {
  public static var name: String { return "Saint Helena Pound" }
  public static var alphabeticCode: String { return "SHP" }
  public static var numericCode: UInt16 { return 654 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Leone (SLL) currency, as defined by ISO 4217.
public struct SLL: ISOCurrency {
  public static var name: String { return "Leone" }
  public static var alphabeticCode: String { return "SLL" }
  public static var numericCode: UInt16 { return 694 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Somali Shilling (SOS) currency, as defined by ISO 4217.
public struct SOS: ISOCurrency {
  public static var name: String { return "Somali Shilling" }
  public static var alphabeticCode: String { return "SOS" }
  public static var numericCode: UInt16 { return 706 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Surinam Dollar (SRD) currency, as defined by ISO 4217.
public struct SRD: ISOCurrency {
  public static var name: String { return "Surinam Dollar" }
  public static var alphabeticCode: String { return "SRD" }
  public static var numericCode: UInt16 { return 968 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The South Sudanese Pound (SSP) currency, as defined by ISO 4217.
public struct SSP: ISOCurrency {
  public static var name: String { return "South Sudanese Pound" }
  public static var alphabeticCode: String { return "SSP" }
  public static var numericCode: UInt16 { return 728 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Dobra (STN) currency, as defined by ISO 4217.
public struct STN: ISOCurrency {
  public static var name: String { return "Dobra" }
  public static var alphabeticCode: String { return "STN" }
  public static var numericCode: UInt16 { return 930 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The El Salvador Colon (SVC) currency, as defined by ISO 4217.
public struct SVC: ISOCurrency {
  public static var name: String { return "El Salvador Colon" }
  public static var alphabeticCode: String { return "SVC" }
  public static var numericCode: UInt16 { return 222 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Syrian Pound (SYP) currency, as defined by ISO 4217.
public struct SYP: ISOCurrency {
  public static var name: String { return "Syrian Pound" }
  public static var alphabeticCode: String { return "SYP" }
  public static var numericCode: UInt16 { return 760 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Lilangeni (SZL) currency, as defined by ISO 4217.
public struct SZL: ISOCurrency {
  public static var name: String { return "Lilangeni" }
  public static var alphabeticCode: String { return "SZL" }
  public static var numericCode: UInt16 { return 748 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Baht (THB) currency, as defined by ISO 4217.
public struct THB: ISOCurrency {
  public static var name: String { return "Baht" }
  public static var alphabeticCode: String { return "THB" }
  public static var numericCode: UInt16 { return 764 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Somoni (TJS) currency, as defined by ISO 4217.
public struct TJS: ISOCurrency {
  public static var name: String { return "Somoni" }
  public static var alphabeticCode: String { return "TJS" }
  public static var numericCode: UInt16 { return 972 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Turkmenistan New Manat (TMT) currency, as defined by ISO 4217.
public struct TMT: ISOCurrency {
  public static var name: String { return "Turkmenistan New Manat" }
  public static var alphabeticCode: String { return "TMT" }
  public static var numericCode: UInt16 { return 934 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Tunisian Dinar (TND) currency, as defined by ISO 4217.
public struct TND: ISOCurrency {
  public static var name: String { return "Tunisian Dinar" }
  public static var alphabeticCode: String { return "TND" }
  public static var numericCode: UInt16 { return 788 }
  public static var minorUnits: UInt8 { return 3 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Pa’anga (TOP) currency, as defined by ISO 4217.
public struct TOP: ISOCurrency {
  public static var name: String { return "Pa’anga" }
  public static var alphabeticCode: String { return "TOP" }
  public static var numericCode: UInt16 { return 776 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Turkish Lira (TRY) currency, as defined by ISO 4217.
public struct TRY: ISOCurrency {
  public static var name: String { return "Turkish Lira" }
  public static var alphabeticCode: String { return "TRY" }
  public static var numericCode: UInt16 { return 949 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Trinidad and Tobago Dollar (TTD) currency, as defined by ISO 4217.
public struct TTD: ISOCurrency {
  public static var name: String { return "Trinidad and Tobago Dollar" }
  public static var alphabeticCode: String { return "TTD" }
  public static var numericCode: UInt16 { return 780 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The New Taiwan Dollar (TWD) currency, as defined by ISO 4217.
public struct TWD: ISOCurrency {
  public static var name: String { return "New Taiwan Dollar" }
  public static var alphabeticCode: String { return "TWD" }
  public static var numericCode: UInt16 { return 901 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Tanzanian Shilling (TZS) currency, as defined by ISO 4217.
public struct TZS: ISOCurrency {
  public static var name: String { return "Tanzanian Shilling" }
  public static var alphabeticCode: String { return "TZS" }
  public static var numericCode: UInt16 { return 834 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Hryvnia (UAH) currency, as defined by ISO 4217.
public struct UAH: ISOCurrency {
  public static var name: String { return "Hryvnia" }
  public static var alphabeticCode: String { return "UAH" }
  public static var numericCode: UInt16 { return 980 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Uganda Shilling (UGX) currency, as defined by ISO 4217.
public struct UGX: ISOCurrency {
  public static var name: String { return "Uganda Shilling" }
  public static var alphabeticCode: String { return "UGX" }
  public static var numericCode: UInt16 { return 800 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The US Dollar (USD) currency, as defined by ISO 4217.
public struct USD: ISOCurrency {
  public static var name: String { return "US Dollar" }
  public static var alphabeticCode: String { return "USD" }
  public static var numericCode: UInt16 { return 840 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Peso Uruguayo (UYU) currency, as defined by ISO 4217.
public struct UYU: ISOCurrency {
  public static var name: String { return "Peso Uruguayo" }
  public static var alphabeticCode: String { return "UYU" }
  public static var numericCode: UInt16 { return 858 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Unidad Previsional (UYW) currency, as defined by ISO 4217.
public struct UYW: ISOCurrency {
  public static var name: String { return "Unidad Previsional" }
  public static var alphabeticCode: String { return "UYW" }
  public static var numericCode: UInt16 { return 927 }
  public static var minorUnits: UInt8 { return 4 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Uzbekistan Sum (UZS) currency, as defined by ISO 4217.
public struct UZS: ISOCurrency {
  public static var name: String { return "Uzbekistan Sum" }
  public static var alphabeticCode: String { return "UZS" }
  public static var numericCode: UInt16 { return 860 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Bolívar Soberano (VES) currency, as defined by ISO 4217.
public struct VES: ISOCurrency {
  public static var name: String { return "Bolívar Soberano" }
  public static var alphabeticCode: String { return "VES" }
  public static var numericCode: UInt16 { return 928 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Dong (VND) currency, as defined by ISO 4217.
public struct VND: ISOCurrency {
  public static var name: String { return "Dong" }
  public static var alphabeticCode: String { return "VND" }
  public static var numericCode: UInt16 { return 704 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Vatu (VUV) currency, as defined by ISO 4217.
public struct VUV: ISOCurrency {
  public static var name: String { return "Vatu" }
  public static var alphabeticCode: String { return "VUV" }
  public static var numericCode: UInt16 { return 548 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Tala (WST) currency, as defined by ISO 4217.
public struct WST: ISOCurrency {
  public static var name: String { return "Tala" }
  public static var alphabeticCode: String { return "WST" }
  public static var numericCode: UInt16 { return 882 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The CFA Franc BEAC (XAF) currency, as defined by ISO 4217.
public struct XAF: ISOCurrency {
  public static var name: String { return "CFA Franc BEAC" }
  public static var alphabeticCode: String { return "XAF" }
  public static var numericCode: UInt16 { return 950 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The East Caribbean Dollar (XCD) currency, as defined by ISO 4217.
public struct XCD: ISOCurrency {
  public static var name: String { return "East Caribbean Dollar" }
  public static var alphabeticCode: String { return "XCD" }
  public static var numericCode: UInt16 { return 951 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The CFA Franc BCEAO (XOF) currency, as defined by ISO 4217.
public struct XOF: ISOCurrency {
  public static var name: String { return "CFA Franc BCEAO" }
  public static var alphabeticCode: String { return "XOF" }
  public static var numericCode: UInt16 { return 952 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The CFP Franc (XPF) currency, as defined by ISO 4217.
public struct XPF: ISOCurrency {
  public static var name: String { return "CFP Franc" }
  public static var alphabeticCode: String { return "XPF" }
  public static var numericCode: UInt16 { return 953 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Yemeni Rial (YER) currency, as defined by ISO 4217.
public struct YER: ISOCurrency {
  public static var name: String { return "Yemeni Rial" }
  public static var alphabeticCode: String { return "YER" }
  public static var numericCode: UInt16 { return 886 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Rand (ZAR) currency, as defined by ISO 4217.
public struct ZAR: ISOCurrency {
  public static var name: String { return "Rand" }
  public static var alphabeticCode: String { return "ZAR" }
  public static var numericCode: UInt16 { return 710 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Zambian Kwacha (ZMW) currency, as defined by ISO 4217.
public struct ZMW: ISOCurrency {
  public static var name: String { return "Zambian Kwacha" }
  public static var alphabeticCode: String { return "ZMW" }
  public static var numericCode: UInt16 { return 967 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The Zimbabwe Dollar (ZWL) currency, as defined by ISO 4217.
public struct ZWL: ISOCurrency {
  public static var name: String { return "Zimbabwe Dollar" }
  public static var alphabeticCode: String { return "ZWL" }
  public static var numericCode: UInt16 { return 932 }
  public static var minorUnits: UInt8 { return 2 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The currency suitable for testing; as defined by ISO 4217.
///
/// As ISO 4217 does not specify a minor unit for XTS, the value of `1` is used for validating rounding errors.
public struct XTS: ISOCurrency {
  public static var name: String { return "Code reserved for testing" }
  public static var alphabeticCode: String { return "XTS" }
  public static var numericCode: UInt16 { return 963 }
  public static var minorUnits: UInt8 { return 1 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

/// The currency to represent a transaction where no currency was involved; as defined by ISO 4217.
///
/// As ISO 4217 does not specify a minor unit for XXX, the value of `0` is used.
public struct XXX: ISOCurrency {
  public static var name: String { return "No currency" }
  public static var alphabeticCode: String { return "XXX" }
  public static var numericCode: UInt16 { return 999 }
  public static var minorUnits: UInt8 { return 0 }
  
  public let rawValue: Decimal
  
  public init(exactly value: Decimal) { self.rawValue = value }
}

