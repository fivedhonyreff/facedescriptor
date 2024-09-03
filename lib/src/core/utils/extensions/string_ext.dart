extension StringExtension on String {
  String removeHtmlTags() {
    // Define a regular expression to match HTML tags
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    // Replace HTML tags with an empty string
    return replaceAll(exp, '');
  }
}