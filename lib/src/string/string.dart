part of common_used_functions;


// not sure
List<String> match (Pattern pattern, String a) {
  return pattern.allMatches(a).map((match) => match.group(0));
}

String replaceAll(Pattern from, String replace, String source) {
  return source.replaceAll(from, replace);
}

String replaceFirst(Pattern from, String replace, String source) {
  return source.replaceFirst(from, replace);
}

List<String> split(Pattern pattern, String str) {
  return str.split(pattern);
}

String toLower(String s) => s.toLowerCase();

String toUpper(String s) => s.toUpperCase();

String trim(String s) => s.trim();

Iterable<String> splitEveryStr(int n, String text) => text.splitEveryStr(n);
  

// text utils
bool isEmpty(String text)
  => text.isNull || text.isEmpty;

 /// 每隔 x位 加 pattern
String formatDigitPattern(String text, {int digit = 4, String pattern = ' '}) {
  assert(text.notNull, "text cant be null");
  if (isEmpty(text)) {
    return '';
  }
  return text.splitEveryStr(digit).join(pattern);
}

/// 每隔 x位 加 pattern, 从末尾开始
String formatDigitPatternEnd(String text, {int digit = 4, String pattern = ' '}) 
  => formatDigitPattern(text?.reversed, digit: digit, pattern: pattern).reversed;

/// 每隔4位加空格
String formatSpace4(String text) => formatDigitPattern(text);

/// 每隔3三位加逗号
/// num 数字或数字字符串。int型。
String formatComma3(num number) => formatDigitPatternEnd(number?.toString(), digit: 3, pattern: ',');

/// hideNumber
String hideNumber(String phoneNum, {int start = 3, int end = 7, String replacement = '****'})
  => phoneNum?.replaceRange(start, end, replacement);

String reverseStr(String s) => s.reversed;