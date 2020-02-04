part of common_used_functions;

Fn1<A, bool> allPass<A>(Iterable<Fn1<A, bool>> preficators) {
  return (A a) => all(identity, preficators.map((p) => p(a)));
}

bool and(bool a, bool b) => a && b;

Fn1<A, bool> complement<A>(Fn1<A, bool> f) => f.pipe(not);

Fn1<A, A> defaultTo<A>(A defaultValue) {
  return (A a) {
    return a.isNull ? defaultValue : a;
  };
}

// ifElse(gt(1), inc, dec);
Fn1<A, B> ifElse<A, B>(Fn1<A, bool> predicator, Fn1<A, B> ifTrue, Fn1<A, B> ifFalse) {
  return (A a) => predicator(a) ? ifTrue(a) : ifFalse(a);
}

Fn2<A, B, C> ifElse2<A, B, C>(Fn2<A, B, bool> predicator, Fn2<A, B, C> ifTrue, Fn2<A, B, C> ifFalse) {
  return (A a, B b) => predicator(a, b) ? ifTrue(a, b) : ifFalse(a, b);
}




bool not(bool a) => !a;

bool or(bool a, bool b) => a || b;

Fn1<A, A> unless<A>(Fn1<A, bool> f, Fn1<A, A> g) {
  return (A a) => f(a) ? a : g(a);
}

Fn1<A, A> when<A>(Fn1<A, bool> f, Fn1<A, A> g) {
  return (A a) => f(a) ? g(a) : a;
}

Fn1<A, A> until<A>(Fn1<A, bool> f, Fn1<A, A> g) {
  return (A a) {
    var result = a;
    while (!f(result)) {
      result = g(a);
    }
    return result;
  };
}

