part of common_used_functions;


extension StringExtension on String {
  String take(int count)
    => String.fromCharCodes(this.codeUnits.take(count.minAs0()));

  String takeLast(int count)
   => String.fromCharCodes(this.codeUnits.takeLast(count.minAs0()));

  String skip(int count) 
    => String.fromCharCodes(this.codeUnits.skip(count.minAs0()));

  String skipLast(int count)
    => String.fromCharCodes(this.codeUnits.skipLast(count.minAs0()));

  String takeWhile(Fn1<String, bool> f) 
    => String.fromCharCodes(this.codeUnits.takeWhile((c) => f(String.fromCharCode(c))));

  String skipWhile(Fn1<String, bool> f) 
    => String.fromCharCodes(this.codeUnits.skipWhile((c) => f(String.fromCharCode(c))));

  /// n \in [1, length]
  Iterable<String> splitEveryStr(int n)
    => splitEvery(n, this.codeUnits).map((it) => String.fromCharCodes(it));

  String get reversed => String.fromCharCodes(this.codeUnits.reversed);
}