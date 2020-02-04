
import 'package:flutter_test/flutter_test.dart' hide equals; 
import 'package:common_used_functions/common_used_functions.dart';

void main() {
  Fn0<Future<dynamic>> f = () async {
    print(["start"]);
    await Future.delayed(3.seconds);
    print(DateTime.now());
    return 1;
  };

  // var g = series(f, true);
  // var h = series(f, false);
  // g();
  // h();
  // test("series", () async {
  //   expect((await g()), 1);
  // });

  test("basefunctions", () {
    expect(always(1)(), 1);
    expect(ap([inc, dec, negative], [1, 2, 3]), [2, 1, -3]);
    expect(1.applyTo(inc), 2);
  });

  test("list functions", () {
    expect(groupWith(
      equals,
      [0, 1, 1, 2]
    ).equals([[0], [1, 1], [2]]), true);
    expect(groupWith(
      (a, b) => a + 1 == b, [0, 1, 1, 2, 3, 5, 8, 13, 21]
    ).equals([[0, 1], [1, 2, 3], [5], [8], [13], [21]]), true);
  }); 

  const x = 5;
  test("expr", () {
    expect(ifExpr(x > 5, "x > 5")
    .elif(x == 5, "x = 5")
    .otherwise('x < 5'), 'x = 5');

    expect(switchExpr<int, String>(x)
      .caseOf(4, 'x = 4')
      .caseOf(5, 'x = 5')
      .otherwise('x == ?'), 'x = 5');
  });

}
