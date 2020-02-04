part of common_used_functions;


extension NumExtension on num {
  num get dec => this - 1;
  num get inc => this + 1;
  num get negate => 0 - this;
}