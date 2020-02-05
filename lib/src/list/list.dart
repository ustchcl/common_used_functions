part of common_used_functions;
typedef bool P<A>(A _);

Iterable<A> adjust<A>(
  int index,
  Fn1<A, A> f,
  List<A> ia
) {
  var result = ia.clone.toList();
  result.adjust(index, f);
  return result;
}

bool all<A>(P<A> predicator, Iterable<A> ia) {
  return ia.fold(true, (bool t, A a) => t && predicator(a));
}

bool any<A>(P<A> predicator, Iterable<A> ia) {
  return ia.fold(false, (bool t, A a) => t || predicator(a));
}

Iterable<Iterable<A>> aperture<A>(int n, Iterable<A> ia) {
  assert(ia.length >= n, "If n is greater than the length of the list, an empty list is returned.");
  assert(n >= 0, "n should be greater than 0.");
  if (ia.length < n || n < 0) {
    return [];
  }
  return range(0, ia.length - n + 1).map((i) => ia.skip(i).take(n));
}

Iterable<A> append<A>(A a, Iterable<A> ia)
  => ia.clone.followedBy(of(a));


Iterable<B> chain<A, B>(Fn1<A, Iterable<B>> f, Iterable<A> ia) {
  return ia.map(f).fold(Iterable.empty(), (a, b) => a = a.followedBy(b));
}


Iterable<A> concat<A>(Iterable<A> ia1, Iterable<A> ia2) {
  return ia1.followedBy(ia2);
}

String concatStr(String s1, String s2) => s1 + s2;

Iterable<A> skip<A>(int n, Iterable<A> ia) => ia.skip(n);

Iterable<A> skipLast<A>(int n, Iterable<A> ia) {
  return ia.skipLast(n);
}

Iterable<A> skipLastWhere<A>(P<A> f, Iterable<A> ia) {
  var len = 0;
  ia.forEach((a) { 
    if (f(a)) {
      len += 1;
    } else {
      len = 0;
    }
  });
  return skipLast(len, ia);
}

Iterable<A> dropRepeats<A>(Iterable<A> ia) {
  return ia.whereIndexed((a, i) => i == 0 || a != ia.elementAt(i - 1));
}

Iterable<A> dropRepeatsWith<A>(Fn2<A, A, bool> f, Iterable<A> ia) {
  var p = f.pipe(not);
  return ia.whereIndexed((a, i) => i == 0 || p(a, ia.elementAt(i - 1)));
}

Iterable<A> skipWhile<A>(P<A> f, Iterable<A> ia) => ia.skipWhile(f);

bool endsWith<A>(Iterable<A> test, Iterable<A> source) {
  return source.skip((source.length - test.length).minAs0()).equals(test);
}

Iterable<A> filter<A>(P<A> f, Iterable<A> ia) => ia.where(f);

A find<A>(P<A> f, Iterable<A> ia) => ia.firstWhere(f, orElse: () => null);

int findIndex<A>(P<A> f, Iterable<A> ia) => ia.firstIndexWhere(f);

A findLast<A>(P<A> f, Iterable<A> ia) => ia.toList().lastWhere(f, orElse: () => null);

int findLastIndex<A>(P<A> f, Iterable<A> ia) => ia.toList().lastIndexWhere(f);

Iterable<A> flatten<A>(Iterable<Iterable<A>> iia) {
  return iia.fold(Iterable.empty(), concat);
}

Iterable<A> forEach<A>(void Function(A) f, Iterable<A> ia) {
  ia.forEach(f);
  return ia;
}

Map<String, Iterable<A>> groupBy<A>(Fn1<A, String> f, Iterable<A> ia) 
  => reduceBy(flip(append), Iterable.empty(), f, ia);

Iterable<Iterable<A>> groupWith<A>(Fn2<A, A, bool> f, Iterable<A> ia) {
  Iterable<Iterable<A>> result = Iterable.empty();
  var releation = aperture(2, ia);
  var it = ia.clone;
  int cursor = 0;
  var check = (int index) {
    if (index == 0) {
      return true;
    }
    var r = releation.elementAt(index - 1);
    return f(r.first, r.last);
  };


  while (it.length > cursor) {
    var taked = it.skip(cursor).takeWhileIndex((a, index) {
      return index == 0 || check(cursor + index);
    });
    cursor += taked.length;
    result.followedBy(of(taked));
  }
  return result;
}

A head<A>(Iterable<A> ia) => ia.first;

A safeHead<A>(Iterable<A> ia) => ia.first;

bool includes<A>(A a, Iterable<A> ia) => ia.contains(a);

int indexOf<A>(A a, Iterable<A> ia) => ia.toList().indexOf(a);

Iterable<A> init<A>(Iterable<A> ia) => ia.skipLast(1);

Iterable<A> insert<A>(int index, A a, Iterable<A> ia) 
  => insertAll(index, of(a), ia);

Iterable<A> insertAll<A>(int index, Iterable<A> insertPart, Iterable<A> ia) {
  var n = index.minAs0().maxAs(ia.length);
  return ia.take(n).followedBy(insertPart).followedBy(ia.skip(n));
}

Iterable<A> intersperse<A>(A a, Iterable<A> ia) {
  // recursive version
  // if (ia.length <= 1) return ia.clone;
  // return of(ia.first).followedBy(of(a)).followedBy(intersperse(a, ia.skip(1)));

  if (ia.length <= 1) return ia.clone;
  return chain((_) => [_, a], ia).skipLast(1);
}

String join<A>(String separator, Iterable<A> ia) 
  => ia.join(separator);

A last<A>(Iterable<A> ia) => ia.last;
A safeLast<A>(Iterable<A> ia) => ia.last;

int lastIndexOf<A>(A a, Iterable<A> ia) 
  => ia.toList().lastIndexOf(a);

int length<A>(Iterable<A> ia) => ia.length;

Iterable<B> map<A, B>(Fn1<A, B> f, Iterable<A> ia) => ia.map(f);

// Tuple mapAccum
Tuple2<A, List<A>> mapAccum<A, B>(
  Fn1<Tuple2<A, B>, Tuple2<A, A>> f,
  A initial,
  Iterable<B> ib
) {
  var result = scan((a, b) => f(Tuple2(a, b)).item1, initial, ib);
  return Tuple2(result.last, result.tail);
}

Tuple2<A, List<A>> mapAccumRight<A, B>(
  Fn1<Tuple2<A, B>, Tuple2<A, A>> f,
  A initial,
  Iterable<B> ib
) {
  var result = scan((a, b) => f(Tuple2(a, b)).item1, initial, ib.toList().reversed);
  return Tuple2(result.last, result.tail);
}

Iterable<A> move<A>(int from, int to, Iterable<A> ia) {  
  var _from = from.minAs0().maxAs(ia.length - 1);
  var _to = to.minAs0().maxAs(ia.length - 1);
  if (_from == _to) {
    return ia.clone;
  } else if (_from > _to) {
    return ia.take(_to)
      .followedBy(ia.skip(_from).take(1))
      .followedBy(ia.skip(_to).take(_from - _to))
      .followedBy(ia.skip(_from + 1));
  } else {
    return ia.take(_from)
      .followedBy(ia.skip(_from + 1).take(_to - _from - 1))
      .followedBy(ia.skip(_from).take(1))
      .followedBy(ia.skip(_to));
  }
}

bool none<A>(P<A> preficator, Iterable<A> ia)
  => all(preficator.pipe(not), ia);

A nth<A>(int index, Iterable<A> ia) => ia.elementAt(index);

// safeNth

Tuple2<A, B> pair<A, B>(A a, B b) => Tuple2(a, b);

Tuple2<Iterable<A>, Iterable<A>> partition<A>(P<A> predicator, Iterable<A> ia) {
  return pair(ia.where(predicator), ia.reject(predicator));
}

Iterable<A> prepend<A>(A a, Iterable<A> ia) => of(a).followedBy(ia);

// [start, end)
List<int> range(int from, int to, [int step = 1]) {
  List<int> result = [];
  for (var i = from; i < to; i += step) {
    result.add(i);
  }
  return result;
}

A reduce<A, B>(Fn2<A, B, A> f, A initial, Iterable<B> ib) 
  => ib.fold(initial, f);

Map<String, A> reduceBy<A, B>(Fn2<A, B, A> f, A initial, Fn1<B, String> g, Iterable<B> ib) {
  Map<String, A> result = {};
  ib.forEach((b) {
    var key = g(b);
    if (result.containsKey(key)) {
      result[key] = f(result[key], b);
    } else {
      result[key] = initial;
    }
  });
  return result;
}

A reduceRight<A, B>(Fn2<B, A, A> f, A initial, Iterable<B> ib) 
  => ib.toList().reversed.fold(initial, flip(f));

A reduceWhile<A, B>(Fn2<A, B, bool> predicator, Fn2<A, B, A> f, A initial, Iterable<B> ib)
  => ib.fold(initial, ifElse2(predicator, f, always2));

Iterable<A> reject<A>(P<A> f, Iterable<A> ia) => ia.reject(f);

Iterable<A> remove<A>(int start, int count, Iterable<A> ia) {
  var _start = start.minAs0();
  var _count = count.minAs0();
  return ia.take(_start).followedBy(ia.skip(_start + _count));
}

Iterable<A> repeat<A>(A a, int n) 
  => range(0, n.minAs0()).map(always(a));

Iterable<A> reverse<A>(Iterable<A> ia) => ia.toList().reversed;

List<A> scan<A, B>(Fn2<A, B, A> f, A initial, Iterable<B> ib) {
  List<A> result = of(initial);
  var acc = initial;
  ib.forEach((b) {
    acc = f(acc, b);
    result.add(acc);
  });
  return result;
}

Iterable<A> slice<A>(int from, int to, Iterable<A> ia) 
  => ia.skip(from).take((to - from).minAs0());

List<A> sort<A>(Fn2<A, A, int> compare, Iterable<A> ia)
  => ia.clone.toList()..sort(compare);

Tuple2<Iterable<A>, Iterable<A>> splitAt<A>(int index, Iterable<A> ia)
  => pair(
    ia.take(index), 
    ia.skip(index)
  );

Iterable<Iterable<A>> splitEvery<A>(int n, Iterable<A> ia) {
  var _n = n.maxAs(ia.length).minAs(1);
  var result = Iterable.empty();
  var it = ia.clone;
  while (it.length > 0) {
    result = result.followedBy(of(it.take(_n)));
    it = it.skip(_n);
  }
  return result;
}

Tuple2<Iterable<A>, Iterable<A>> splitWhen<A>(P<A> f, Iterable<A> ia) {
  var index = ia.firstIndexWhere(f);
  if (index == -1) {
    return pair(ia.clone, Iterable.empty());
  } else {
    return splitAt(index, ia);
  }
}

bool startsWith<A>(Iterable<A> sub, Iterable<A> ia) => ia.startsWith(sub);

Iterable<A> tail<A>(Iterable<A> ia) => ia.tail;

Iterable<A> take<A>(int count, Iterable<A> ia) => ia.take(count);

Iterable<A> takeLast<A>(int count, Iterable<A> ia) => ia.takeLast(count);

Iterable<A> takeLastWhile<A>(P<A> f, Iterable<A> ia) => ia.takeLastWhile(f);

Iterable<A> takeWhile<A>(P<A> f, Iterable<A> ia) => ia.takeWhile(f);

Iterable<A> times<A>(Fn1<int, A> gen, int count) => range(0, count).map(gen);

Iterable<Iterable<A>> transpose<A>(Iterable<Iterable<A>> iia) {
  var col = iia.map(length).fold(-1, max);
  var result = Iterable.generate(col, (r) {
    iia.fold<Iterable<A>>(Iterable.empty(), (acc, ia) {
      return acc.followedBy(ia.skip(r).take(1));
    });
  });
  return result;
}

Iterable<A> uniq<A>(Iterable<A> ia)
  => ia.toSet().toList();

Iterable<A> uniqBy<A, B>(Fn1<A, B> f, Iterable<A> ia) {
  return ia.fold<Iterable<A>>(Iterable.empty(), (acc, a) {
    if (acc.map(f).contains(f(a))) {
      return acc;
    } else {
      return acc.followedBy(of(a));
    }
  });
}

Iterable<A> uniqWith<A, B>(Fn2<A, A, bool> f, Iterable<A> ia) {
  return ia.fold<Iterable<A>>(Iterable.empty(), (acc, a) {
    if (acc.where((_) => f(a, _)).length > 0) {
      return acc;
    } else {
      return acc.followedBy(of(a));
    }
  });
}

Iterable<A> update<A>(int index, A a, Iterable<A> ia) {
  return ia.clone.toList()..adjust(index, always(a));
}

Iterable<A> without<A>(Iterable<A> target, Iterable<A> source) 
  => source.reject((a) => target.contains(a));

Iterable<Tuple2<A, B>> xpord<A, B>(Iterable<A> ia, Iterable<B> ib) {
  return flatten(ia.map((a) => ib.map((b) => pair(a, b))));
}

Iterable<Tuple2<A, B>> zip<A, B>(Iterable<A> ia, Iterable<B> ib) {
  var length = min(ia.length, ib.length);
  return range(0, length).map((i) => pair(ia.elementAt(i), ib.elementAt(i)));
}

Iterable<C> zipWith<A, B, C>(Iterable<A> ia, Iterable<B> ib, Fn2<A, B, C> f) {
  var length = min(ia.length, ib.length);
  return range(0, length).map((index) => f(ia.elementAt(index), ib.elementAt(index)));
}