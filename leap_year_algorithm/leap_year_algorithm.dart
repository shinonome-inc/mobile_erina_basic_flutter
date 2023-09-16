import 'dart:io';
void main(List<String> arguments) {
  print('整数を入力してください。');
  String input = stdin.readLineSync() ?? ''; // 標準入力から文字列を読み込む
  int number = int.parse(input); // 文字列を整数に変換
  //var isLeapYear = number;
  if (number % 4 == 0 && !(number % 100 == 0 && number % 400 != 0)){
    print('閏年です。');
  }else{
    print('閏年ではない。');
  }
}



