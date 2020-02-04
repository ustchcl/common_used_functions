part of common_used_functions;

typedef F1 Fn0<F1>();
typedef F2 Fn1<F1, F2>(F1 f1);
typedef F3 Fn2<F1, F2, F3>(F1 f1, F2 f2);
typedef F4 Fn3<F1, F2, F3, F4>(F1 f1, F2 f2, F3 f3);
typedef F5 Fn4<F1, F2, F3, F4, F5>(F1 f1, F2 f2, F3 f3, F4 f4);

typedef F1 Fn_0<F1>();
typedef F2 Fn_1<F1, F2>([F1 f1]);
typedef F3 Fn_2<F1, F2, F3>([F1 f1, F2 f2]);
typedef F4 Fn_3<F1, F2, F3, F4>([F1 f1, F2 f2, F3 f3]);
typedef F5 Fn_4<F1, F2, F3, F4, F5>([F1 f1, F2 f2, F3 f3, F4 f4]);

typedef B Curry0<A, B>(A a);   // Curry0 = Fn1
typedef Curry0<B, C> Curry1<A, B, C>(A _);
typedef Curry1<B, C, D> Curry2<A, B, C, D>(A _);
typedef Curry2<B, C, D, E> Curry3<A, B, C, D, E>(A _);
