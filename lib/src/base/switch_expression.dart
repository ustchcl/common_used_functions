part of common_used_functions;

class _SwitchExpression<S, T>  {
  S source;
  T _value;
  bool _shot = false;

  _SwitchExpression(this.source);

  _SwitchExpression<S, T> caseOf(S s, T t) {
    if (!_shot && source == s) {
      _shot = true;
      _value = t;
    }
    return this;
  }
    
  T otherwise(T t) => _shot ? _value : t;
}

_SwitchExpression<A, B> switchExpr<A, B>(A a) {
  return _SwitchExpression(a);
}

class _IfExpression<T>  {
  T value;
  bool shot = false;

  _IfExpression();

  _IfExpression<T> elif(bool condition, T t) {
    if (!shot && condition) {
      this.shot = true;
      this.value = t;
    }
    return this;
  }
    
  T otherwise(T t) => shot ? value : t;
}

_IfExpression<A> ifExpr<A>(bool condition, A a) {
  return _IfExpression<A>().elif(condition, a);
}