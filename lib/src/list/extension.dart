part of common_used_functions;

extension IterableExtension<A> on Iterable<A> {
  Iterable<A> get clone => this.map(identity);


  void forEachIndexed(void Function(A, int) f) {
    range(0, this.length).forEach((i) => f(this.elementAt(i), i));
  }

  Iterable<A> takeWhileIndex(bool Function(A, int) f) {
    var index = this.firstIndexWhere((a, [i]) => not(f(a, i)));
    var n = index == -1 ? this.length : index;
    return this.take(n);
  }
  
  Iterable<A> whereIndexed(Fn2<A, int, bool> f) {
    return range(0, this.length).where((i) => f(this.elementAt(i), i)).map(this.elementAt);
  }

  Iterable<B> mapIndexed<B>(Fn2<A, int, B> f) {
    return range(0, this.length).map((i) => f(this.elementAt(i), i));
  }

  bool equals(Iterable<A> ia) {
    return this.length != ia.length && all(identity, zipWith(this, ia, (a, b) => a == b));
  }

  int firstIndexWhere(bool Function(A a, [int index]) f) {
    var result = -1;
    var count = 0;
    while (count < this.length) {
      if (f(this.elementAt(count), count)) {
        result = count;
        break;
      }
      count += 1;
    }
    return result;
  }

  int lastIndexWhere(bool Function(A a, int index) f) {
    var temp = range(0, this.length).where((i) => f(this.elementAt(i), i));
    if (temp.length == 0) {
      return -1;
    } else {
      return temp.last;
    }
  }

  Iterable<A> reject(Fn1<A, bool> predicator) => this.where(predicator.pipe(not));

  Iterable<A> skipLast(int n) 
    => this.take((this.length - n).minAs0());

  bool startsWith(Iterable<A> ia) => this.take(ia.length).equals(ia);

  Iterable<A> takeLast(int count) => this.skip((this.length - count).minAs0());

  Iterable<A> takeLastWhile(Fn1<A, bool> predicator) {
    var index = this.lastIndexWhere((a, index) => predicator.pipe(not)(a));
    return this.skip(index);
  }



  Iterable<A> get tail => this.skip(1);
}

extension ListExntension<A> on List<A> {
  void adjust(int index, Fn1<A, A> f) {
    if (index < 0 || index > this.length) {
      return;
    }
    this[index] = f(this[index]);
  }

  void removeFirst() {
    if (this.length > 0) {
      this.removeAt(0);
    }
  }

  int lastIndexOf(A a) {
    return this.reversed.toList().indexOf(a);
  }
}