part of common_used_functions;

extension ObjectExtension<A> on A {
  // Option<A> toOption() => option(this);

  bool get isNull => this == null;
  bool get notNull => this != null;

  A defaultTo(A defaultValue) => this.isNull ? defaultValue : this;

  B applyTo<B>(Fn1<A, B> func) => func(this);
}

extension IntExtension on int {
  get seconds => Duration(seconds: this);
  get minutes => Duration(minutes: this);
}

extension NumExtension2 on num {
  num minAs(num n) => max(this, n);
  num minAs0() => this.minAs(0);
  num maxAs(num n) => min(this, n);
  num maxAs0() => this.maxAs(0);
}