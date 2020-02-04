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


