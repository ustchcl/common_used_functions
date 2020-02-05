part of common_used_functions;

num inc(num n) => n + 1;
num dec(num n) => n - 1;
num negative(num n) => - n;


int addi(int v1, int v2) => v1 + v2;
Fn1<int, int> addic(int v1) => (int v2) => v1 + v2;
double addf(num v1, num v2) => v1 + v2.toDouble();
Fn1<double, double> addfc(num v1) => (num v2) => v1 + v2.toDouble();

int subtracti(int v1, int v2) => v1 - v2;
Fn1<int, int> subtractic(int v1) => (int v2) => v1 - v2;
double subtractf(num v1, num v2) => v1 - v2.toDouble();
Fn1<double, double> subtractfc(num v1) => (num v2) => v1 - v2.toDouble();

int multiplyi(int v1, int v2) => v1 * v2;
Fn1<int, int> multiplyic(int v1) => (int v2) => v1 * v2;
double multiplyf(num v1, num v2) => v1 * v2.toDouble();
Fn1<double, double> multiplyfc(num v1) => (num v2) => v1 * v2.toDouble();

double divide(num v1, num v2) => v1 / v2;
Fn1<num, num> dividec(num v1) => (num v2) => v1 / v2;

Option<double> mean(List<num> arr) {
  if (arr.length == 0) {
    return None<double>();
  } else {
    return Some<double>(sum(arr) / arr.length);
  }
}

Option<double> median(List<num> arr) {
  if (arr.length == 0) {
    return None<double>();
  } else {
    arr.sort();
    if (arr.length % 2 == 0) {
      var indexL = (arr.length - 1) ~/ 2;
      var indexR = arr.length ~/ 2;
      var value = (arr[indexL] + arr[indexR]) / 2;
      return Some(value);
    } else {
      var index = (arr.length - 1) ~/ 2;
      return Some(arr[index].toDouble());
    }
  }
}

double sum(List<num> arr) => arr.fold(0, addf);

double product(List<num> arr) => arr.fold(1, multiplyf);


