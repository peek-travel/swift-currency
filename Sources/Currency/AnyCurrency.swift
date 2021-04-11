//import Foundation
//
///// A type-erased container for a `Currency` value.
//public struct AnyCurrency {
//  public var base: Any { return self._box._base }
//  
//  private var _box: _AnyCurrencyBox
//  
//  public init<C: Currency>(_ base: C) {
//    self.init(_box: _ConcreteCurrencyBox(base))
//  }
//
//  private init(_box box: _AnyCurrencyBox) {
//    self._box = box
//  }
//}
//
//extension AnyCurrency: Currency {
//  public var metadata: CurrencyMetadata.Type { return self._box.metadata }
//  public var rawValue: Decimal { return self._box.rawValue }
//  public init?(rawValue: Decimal) {
//    guard let box = _Concrete
//  }
//}
//
//private protocol _AnyCurrencyBox {
//  var _canonicalBox: _AnyCurrencyBox { get }
//
//  var rawValue: Decimal { get }
//  var metadata: CurrencyMetadata.Type { get }
//  init?(rawValue: Decimal)
//  init(exactly amount: Decimal)
//  
//  var _base: Any { get }
//  func _unbox<T: Currency>() -> T?
//}
//
//extension _AnyCurrencyBox {
//  fileprivate var _canonicalBox: _AnyCurrencyBox { return self }
//}
//
//private struct _ConcreteCurrencyBox<Base: Currency>: _AnyCurrencyBox {
//  fileprivate var _baseCurrency: Base
//  
//  fileprivate init(_ value: Base) {
//    self._baseCurrency = value
//  }
//  
//  fileprivate var rawValue: Decimal { return self._baseCurrency.rawValue }
//  var metadata: CurrencyMetadata.Type { return self._baseCurrency.metadata }
//  fileprivate init?(rawValue: Decimal) {
//    guard let value = Base(rawValue: rawValue) else { return nil }
//    self.init(value)
//  }
//  fileprivate init(exactly amount: Decimal) {
//    self.init(Base(exactly: amount))
//  }
//  
//  fileprivate var _base: Any { return self._baseCurrency }
//  fileprivate func _unbox<T: Currency>() -> T? {
//    return (self as _AnyCurrencyBox as? _ConcreteCurrencyBox<T>)?._baseCurrency
//  }
//}
