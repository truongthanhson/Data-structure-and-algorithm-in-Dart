class Solution {
  List<String> fullJustify(List<String> words, int maxWidth) {
    List<String> ans = [];
    String createLine(List<String> words, bool last) {
      int wordCnt = words.length;
      if (wordCnt == 1) return words[0].padRight(maxWidth);
      int wordsLength = words.fold(0, (int a, String b) => a + b.length);
      int minSpace = (maxWidth - wordsLength) ~/ (wordCnt - 1);
      int paddingLeft = (maxWidth - wordsLength) % (wordCnt - 1);
      StringBuffer st = StringBuffer();
      for (int i = 0; i < wordCnt; i++) {
        st.write(words[i]);
        if (last) {
          if (i < wordCnt - 1) st.write(" ");
        } else {
          if (i == wordCnt - 1 && wordCnt > 1) continue;

          for (int j = 0; j < minSpace; j++) {
            st.write(" ");
          }
          if (i < paddingLeft) {
            st.write(" ");
          }
        }
      }
      return last ? st.toString().padRight(maxWidth) : st.toString();
    }

    List<String> currentLines = [];
    int i = 0;
    while (i < words.length) {
      String currentWord = words[i];
      int wordsLength =
          currentLines.fold(0, (int a, String b) => a + b.length) +
              currentWord.length;
      int totalLength = currentLines.length == 0
          ? wordsLength
          : wordsLength + currentLines.length;
      if (totalLength <= maxWidth) {
        currentLines.add(currentWord);
      } else {
        ans.add(createLine(currentLines, false));
        currentLines.clear();
        currentLines.add(currentWord);
      }
      i++;
    }
    if (currentLines.length > 0) ans.add(createLine(currentLines, true));
    return ans;
  }
}

void main(List<String> args) {
  print(Solution().fullJustify(
      ["this", "is", "an", "example", "of", "text", "justification."], 16));
  print(Solution().fullJustify(
      ["What", "must", "be", "acknowledgment", "shall", "be"], 16));
  print(Solution().fullJustify([
    "Science",
    "is",
    "what",
    "we",
    "understand",
    "well",
    "enough",
    "to",
    "explain",
    "to",
    "a",
    "computer.",
    "Art",
    "is",
    "everything",
    "else",
    "we",
    "do"
  ], 20));
}
