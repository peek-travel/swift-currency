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

// WARNING: This file's contents are automatically generated. Any edits to the `.swift` file will be overwritten.

// MARK: Lookup by Alpha

extension CurrencyMint {
  internal static func lookup(byAlphaCode code: String) -> AnyCurrency.Type? {
    switch code {
    case "AED": return AED.self
    case "AFN": return AFN.self
    case "ALL": return ALL.self
    case "AMD": return AMD.self
    case "ANG": return ANG.self
    case "AOA": return AOA.self
    case "ARS": return ARS.self
    case "AUD": return AUD.self
    case "AWG": return AWG.self
    case "AZN": return AZN.self
    case "BAM": return BAM.self
    case "BBD": return BBD.self
    case "BDT": return BDT.self
    case "BGN": return BGN.self
    case "BHD": return BHD.self
    case "BIF": return BIF.self
    case "BMD": return BMD.self
    case "BND": return BND.self
    case "BOB": return BOB.self
    case "BRL": return BRL.self
    case "BSD": return BSD.self
    case "BTN": return BTN.self
    case "BWP": return BWP.self
    case "BYN": return BYN.self
    case "BZD": return BZD.self
    case "CAD": return CAD.self
    case "CDF": return CDF.self
    case "CHF": return CHF.self
    case "CLP": return CLP.self
    case "CNY": return CNY.self
    case "COP": return COP.self
    case "CRC": return CRC.self
    case "CUC": return CUC.self
    case "CUP": return CUP.self
    case "CVE": return CVE.self
    case "CZK": return CZK.self
    case "DJF": return DJF.self
    case "DKK": return DKK.self
    case "DOP": return DOP.self
    case "DZD": return DZD.self
    case "EGP": return EGP.self
    case "ERN": return ERN.self
    case "ETB": return ETB.self
    case "EUR": return EUR.self
    case "FJD": return FJD.self
    case "FKP": return FKP.self
    case "GBP": return GBP.self
    case "GEL": return GEL.self
    case "GHS": return GHS.self
    case "GIP": return GIP.self
    case "GMD": return GMD.self
    case "GNF": return GNF.self
    case "GTQ": return GTQ.self
    case "GYD": return GYD.self
    case "HKD": return HKD.self
    case "HNL": return HNL.self
    case "HRK": return HRK.self
    case "HTG": return HTG.self
    case "HUF": return HUF.self
    case "IDR": return IDR.self
    case "ILS": return ILS.self
    case "INR": return INR.self
    case "IQD": return IQD.self
    case "IRR": return IRR.self
    case "ISK": return ISK.self
    case "JMD": return JMD.self
    case "JOD": return JOD.self
    case "JPY": return JPY.self
    case "KES": return KES.self
    case "KGS": return KGS.self
    case "KHR": return KHR.self
    case "KMF": return KMF.self
    case "KPW": return KPW.self
    case "KRW": return KRW.self
    case "KWD": return KWD.self
    case "KYD": return KYD.self
    case "KZT": return KZT.self
    case "LAK": return LAK.self
    case "LBP": return LBP.self
    case "LKR": return LKR.self
    case "LRD": return LRD.self
    case "LSL": return LSL.self
    case "LYD": return LYD.self
    case "MAD": return MAD.self
    case "MDL": return MDL.self
    case "MGA": return MGA.self
    case "MKD": return MKD.self
    case "MMK": return MMK.self
    case "MNT": return MNT.self
    case "MOP": return MOP.self
    case "MRU": return MRU.self
    case "MUR": return MUR.self
    case "MVR": return MVR.self
    case "MWK": return MWK.self
    case "MXN": return MXN.self
    case "MYR": return MYR.self
    case "MZN": return MZN.self
    case "NAD": return NAD.self
    case "NGN": return NGN.self
    case "NIO": return NIO.self
    case "NOK": return NOK.self
    case "NPR": return NPR.self
    case "NZD": return NZD.self
    case "OMR": return OMR.self
    case "PAB": return PAB.self
    case "PEN": return PEN.self
    case "PGK": return PGK.self
    case "PHP": return PHP.self
    case "PKR": return PKR.self
    case "PLN": return PLN.self
    case "PYG": return PYG.self
    case "QAR": return QAR.self
    case "RON": return RON.self
    case "RSD": return RSD.self
    case "RUB": return RUB.self
    case "RWF": return RWF.self
    case "SAR": return SAR.self
    case "SBD": return SBD.self
    case "SCR": return SCR.self
    case "SDG": return SDG.self
    case "SEK": return SEK.self
    case "SGD": return SGD.self
    case "SHP": return SHP.self
    case "SLL": return SLL.self
    case "SOS": return SOS.self
    case "SRD": return SRD.self
    case "SSP": return SSP.self
    case "STN": return STN.self
    case "SVC": return SVC.self
    case "SYP": return SYP.self
    case "SZL": return SZL.self
    case "THB": return THB.self
    case "TJS": return TJS.self
    case "TMT": return TMT.self
    case "TND": return TND.self
    case "TOP": return TOP.self
    case "TRY": return TRY.self
    case "TTD": return TTD.self
    case "TWD": return TWD.self
    case "TZS": return TZS.self
    case "UAH": return UAH.self
    case "UGX": return UGX.self
    case "USD": return USD.self
    case "UYU": return UYU.self
    case "UYW": return UYW.self
    case "UZS": return UZS.self
    case "VES": return VES.self
    case "VND": return VND.self
    case "VUV": return VUV.self
    case "WST": return WST.self
    case "XAF": return XAF.self
    case "XCD": return XCD.self
    case "XOF": return XOF.self
    case "XPF": return XPF.self
    case "YER": return YER.self
    case "ZAR": return ZAR.self
    case "ZMW": return ZMW.self
    case "ZWL": return ZWL.self
    case "XTS": return XTS.self
    case "XXX": return XXX.self
    default: return nil
    }
  }
}

// MARK: Lookup by Numeric

extension CurrencyMint {
  internal static func lookup(byNumCode code: UInt16) -> AnyCurrency.Type? {
    switch code {
    case 784: return AED.self
    case 971: return AFN.self
    case 8: return ALL.self
    case 51: return AMD.self
    case 532: return ANG.self
    case 973: return AOA.self
    case 32: return ARS.self
    case 36: return AUD.self
    case 533: return AWG.self
    case 944: return AZN.self
    case 977: return BAM.self
    case 52: return BBD.self
    case 50: return BDT.self
    case 975: return BGN.self
    case 48: return BHD.self
    case 108: return BIF.self
    case 60: return BMD.self
    case 96: return BND.self
    case 68: return BOB.self
    case 986: return BRL.self
    case 44: return BSD.self
    case 64: return BTN.self
    case 72: return BWP.self
    case 933: return BYN.self
    case 84: return BZD.self
    case 124: return CAD.self
    case 976: return CDF.self
    case 756: return CHF.self
    case 152: return CLP.self
    case 156: return CNY.self
    case 170: return COP.self
    case 188: return CRC.self
    case 931: return CUC.self
    case 192: return CUP.self
    case 132: return CVE.self
    case 203: return CZK.self
    case 262: return DJF.self
    case 208: return DKK.self
    case 214: return DOP.self
    case 12: return DZD.self
    case 818: return EGP.self
    case 232: return ERN.self
    case 230: return ETB.self
    case 978: return EUR.self
    case 242: return FJD.self
    case 238: return FKP.self
    case 826: return GBP.self
    case 981: return GEL.self
    case 936: return GHS.self
    case 292: return GIP.self
    case 270: return GMD.self
    case 324: return GNF.self
    case 320: return GTQ.self
    case 328: return GYD.self
    case 344: return HKD.self
    case 340: return HNL.self
    case 191: return HRK.self
    case 332: return HTG.self
    case 348: return HUF.self
    case 360: return IDR.self
    case 376: return ILS.self
    case 356: return INR.self
    case 368: return IQD.self
    case 364: return IRR.self
    case 352: return ISK.self
    case 388: return JMD.self
    case 400: return JOD.self
    case 392: return JPY.self
    case 404: return KES.self
    case 417: return KGS.self
    case 116: return KHR.self
    case 174: return KMF.self
    case 408: return KPW.self
    case 410: return KRW.self
    case 414: return KWD.self
    case 136: return KYD.self
    case 398: return KZT.self
    case 418: return LAK.self
    case 422: return LBP.self
    case 144: return LKR.self
    case 430: return LRD.self
    case 426: return LSL.self
    case 434: return LYD.self
    case 504: return MAD.self
    case 498: return MDL.self
    case 969: return MGA.self
    case 807: return MKD.self
    case 104: return MMK.self
    case 496: return MNT.self
    case 446: return MOP.self
    case 929: return MRU.self
    case 480: return MUR.self
    case 462: return MVR.self
    case 454: return MWK.self
    case 484: return MXN.self
    case 458: return MYR.self
    case 943: return MZN.self
    case 516: return NAD.self
    case 566: return NGN.self
    case 558: return NIO.self
    case 578: return NOK.self
    case 524: return NPR.self
    case 554: return NZD.self
    case 512: return OMR.self
    case 590: return PAB.self
    case 604: return PEN.self
    case 598: return PGK.self
    case 608: return PHP.self
    case 586: return PKR.self
    case 985: return PLN.self
    case 600: return PYG.self
    case 634: return QAR.self
    case 946: return RON.self
    case 941: return RSD.self
    case 643: return RUB.self
    case 646: return RWF.self
    case 682: return SAR.self
    case 90: return SBD.self
    case 690: return SCR.self
    case 938: return SDG.self
    case 752: return SEK.self
    case 702: return SGD.self
    case 654: return SHP.self
    case 694: return SLL.self
    case 706: return SOS.self
    case 968: return SRD.self
    case 728: return SSP.self
    case 930: return STN.self
    case 222: return SVC.self
    case 760: return SYP.self
    case 748: return SZL.self
    case 764: return THB.self
    case 972: return TJS.self
    case 934: return TMT.self
    case 788: return TND.self
    case 776: return TOP.self
    case 949: return TRY.self
    case 780: return TTD.self
    case 901: return TWD.self
    case 834: return TZS.self
    case 980: return UAH.self
    case 800: return UGX.self
    case 840: return USD.self
    case 858: return UYU.self
    case 927: return UYW.self
    case 860: return UZS.self
    case 928: return VES.self
    case 704: return VND.self
    case 548: return VUV.self
    case 882: return WST.self
    case 950: return XAF.self
    case 951: return XCD.self
    case 952: return XOF.self
    case 953: return XPF.self
    case 886: return YER.self
    case 710: return ZAR.self
    case 967: return ZMW.self
    case 932: return ZWL.self
    case 963: return XTS.self
    case 999: return XXX.self
    default: return nil
    }
  }
}
