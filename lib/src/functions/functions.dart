part of common_used_functions;


Fn_1<dynamic, A> always<A>(A a) => ([dynamic _]) => a;

A always2<A>(A a, dynamic _) => a;

B apply<A, B>(Fn1<A, B> f, A a) => f(a);

Iterable<B> ap<A, B>(Iterable<Fn1<A, B>> fs, Iterable<A> ia) 
  => zipWith<Fn1<A, B>, A, B>(fs, ia, apply);

Fn2<A, A, int> ascend<A>(Fn1<A, Comparable> f)
  => (A a1, A a2) => f(a1).compareTo(f(a2));

Fn2<A, B, int> comparator<A, B>(Fn2<A, B, bool> f)
  => f.pipe((b) => b ? -1 : 1);


bool F([dynamic _]) => false;

bool T([dynamic _]) => true;

Fn2<B, A, C> flip<A, B, C>(Fn2<A, B, C> f) {
  return (B b, A a) => f(a, b);
}

A identity<A>(A a) => a;

Fn1<A, B>  memoizeWith<A, B>(Fn1<A, B> f) {
  Map<A, B> cache = {};
  return (A a) {
    if (!cache.containsKey(a)) {
      cache[a] = f(a);
    }
    return cache[a];
  };
}

List<A> of<A>(A a) => [a];


Fn1<A, B> once<A, B>(Fn1<A, B> f) {
  B cache;
  return (A a) {
    if (cache.isNull) {
      cache = f(a);
    }
    return cache;
  };
}

Fn0<Future<A>> series<A>(Fn0<Future<A>> f, [bool queue = false]) {
  var running = false;

  List callbacks = [];
  var g = () async {
    if (running) {
      if (!queue) {
        return Future.error("The progress is running");
      } else {
        var c= new Completer();
        callbacks.add(c.complete);
        await c.future;
      }
    } 
    running = true;
    var result = await f();
    running = false;
    if (callbacks.length > 0) {
      var cb = callbacks.removeAt(0);
      cb();
    }
    return result;
  };
  return g;
}


// curry

Curry1<A, B, C> curry1<A, B, C>(Fn2<A, B, C> f) {
  return (A a) => (B b) => f(a, b);
}

Curry2<A, B, C, D> curry2<A, B, C, D>(Fn3<A, B, C, D> f) {
  return (A a) => (B b) => (C c) => f(a, b, c);
}

Curry3<A, B, C, D, E> curry3<A, B, C, D, E>(Fn4<A, B, C, D, E> f) {
  return (A a) => (B b) => (C c) => (D d) => f(a, b, c, d);
}

