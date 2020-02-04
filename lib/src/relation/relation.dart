part of common_used_functions;

num clamp(num min, num max, num value) {
  assert(min < max);
  return value < min ? min : value > max ? max : value;
}

DateTime clampDT(DateTime min, DateTime max, DateTime value) {
  assert(min.isBefore(max));
  return value.isBefore(min) ? min : value.isAfter(max) ? max : value;
}

Map<A, int> countBy<A>(List<A> arr) {
  return {};
}

Iterable<A> difference<A>(Iterable<A> iter1, Iterable<A> iter2) {
  return iter1.toSet().difference(iter2.toSet());
}

bool eqBy<A, B>(Fn1<A, B> func, A a1, A a2) => equals(func(a1), func(a2));

bool equals(Object obj1, Object obj2) => obj1 == obj2;

Fn1<Object, bool> equalsc(Object obj1) => (Object obj2) => obj1 == obj2;

Iterable<A> intersection<A>(Iterable<A> iter1, Iterable<A> iter2) {
  return iter1.toSet().intersection(iter2.toSet());
}


num max(num v1, num v2) => v1 > v2 ? v1 : v2;

num maxBy<A>(Fn1<A, num> func, A a1, A a2) => max(func(a1), func(a2));

num min(num v1, num v2) => v1 < v2 ? v1 : v2;

num minBy<A>(Fn1<A, num> func, A a1, A a2) => min(func(a1), func(a2));


Iterable<A> symmetricDifference<A> (Iterable<A> iter1, Iterable<A> iter2) {
  var set1 = iter1.toSet();
  var set2 = iter2.toSet();
  var union = set1.union(set2);
  var intersection = set1.intersection(set2);
  return union.difference(intersection);
}

Iterable<A> union<A>(Iterable<A> iter1, Iterable<A> iter2) {
  return iter1.toSet().union(iter2.toSet());
}
