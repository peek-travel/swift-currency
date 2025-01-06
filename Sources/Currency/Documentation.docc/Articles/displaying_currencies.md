# Displaying Currencies

How to translate Swift representations into Strings for displaying to users.

## Overview

While type-safety is important, as well as mathematic accuracy, it is extremely common to have a need of displaying currency values to end users.

Localization is not just about translation. You also need to account for
languages that read from right to left or even the meaning of symbols in specific contexts.

So, while ``CurrencyValue`` conforms to [`CustomStringConvertible`](https://developer.apple.com/documentation/swift/customstringconvertible),
the ``CurrencyValue/description`` property is not appropriate in most cases for displaying values to end users.

For displaying values to an end user that accounts for their [`Foundation.Locale`](https://developer.apple.com/documentation/foundation/locale),
the ``CurrencyValue/localizedString(for:)`` and ``CurrencyValue/localizedString(using:)`` methods are available.

Both of these methods are also available when doing [string interpolation](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters/#String-Interpolation).

> Important: The localized string will always be for the ``CurrencyValue/roundedAmount``.

### Example
```swift
// assuming `Foundation.Locale.current` is "en_US"

let price = EUR(2_103.95)
print("Total: \(price.localizedString())") // or \(localize: price)
// €2,103.95

let locale = Locale(identifier: "de_DE")

print("Gesamtpreis: \(price.localizedString(for: locale))") // or \(localize: price, for: locale)
// Gesamtpreis: 2.103,95 €

let formatter = NumberFormatter()
formatter.numberStyle = .currency
formatter.locale = locale
formatter.currencyCode = EUR.alphabeticCode
formatter.currencyGroupingSeparator = "_"
formatter.currencyDecimalSeparator = "."

print("Gesamtpreis: \(price.localizedString(using: formatter))") // or \(localize: price, using: formatter)
// Gesamtpreis: 2_103.95 €
```
