part of common_used_functions;


extension RelationExtension on num {
  num clamp(num from, num to) {
    var _max = max(from, to);
    var _min = min(from, to);
    return this.maxAs(_max).minAs(_min);
  }
}