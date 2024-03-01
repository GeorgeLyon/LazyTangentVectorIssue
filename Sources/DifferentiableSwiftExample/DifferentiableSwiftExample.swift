import _Differentiation

@differentiable(reverse)
public func foo(_ value: Foo) -> Double {
  return value.x + 3
}

public struct Foo: Differentiable {
  var x: Double

  public mutating func move(by offset: TangentVector) {
    self.x += offset.x
  }

  public struct TangentVector: Differentiable, AdditiveArithmetic {
    public var x: Double.TangentVector {
      get { _x }
      set { _x = newValue }
    }
    public var _x: Double.TangentVector
  }
}
