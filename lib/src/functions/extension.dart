part of common_used_functions;

extension FunctionExtension<A, B> on Fn1<A, B> {
  Fn1<A, C> pipe<C>(Fn1<B, C> func) => (A a) => func(this(a));

  Fn1<Z, B> after<Z>(Fn1<Z, A> func) => (Z a) => this(func(a));
}

extension FunctionExtension2<A, B, C> on Fn2<A, B, C> {
  Fn2<A, B, D> pipe<D>(Fn1<C, D> func) => (A a, B b) => func(this(a, b));
}