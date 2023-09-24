
List<String> splitString(String input, List<String> splitSubstrings) {
  String joinedPattern = splitSubstrings.map((substring) {
    return RegExp.escape(substring);
  }).join('|');

  RegExp pattern = RegExp(joinedPattern);

  List<String> substrings = input.split(pattern);

  List<String> result = [];

  int j = 0;

  for (int i = 0; i < substrings.length; i++) {
    result.add(substrings[i]);

    if (i < substrings.length - 1 && j < splitSubstrings.length) {
      result.add(splitSubstrings[j]);
      j++;
    }
  }

  return result;
}
