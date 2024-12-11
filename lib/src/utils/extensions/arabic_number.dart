extension ArabicNumbers on String {
  String toArabicNumbers() {
    String input = this;
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = [
      '\u0660', // 0
      '\u0661', // 1
      '\u0662', // 2
      '\u0663', // 3
      '\u0664', // 4
      '\u0665', // 5
      '\u0666', // 6
      '\u0667', // 7
      '\u0668', // 8
      '\u0669', // 9
    ];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], arabic[i]);
    }
    return input;
  }
}
