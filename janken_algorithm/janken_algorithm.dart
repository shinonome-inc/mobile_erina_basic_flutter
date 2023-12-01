import 'dart:io';
import 'dart:math' as math;

void main(List<String> arguments) {
  int yh = math.Random().nextInt(3);
  final List<String> hands = ["グー", "チョキ", "パー"];

  print("じゃんけんの手を入力してください");
  String input = stdin.readLineSync() ?? '';
  int mh;
  if (input == 'グー') {
    mh = 0;
  } else if (input == 'チョキ') {
    mh = 1;
  } else if (input == 'パー') {
    mh = 2;
  } else {
    mh = -1;
  }




  if (mh == yh) {
    print('相手:${hands[yh]}');
    print("あいこ");
  } else
  if ((mh == 0 && yh == 1) || (mh == 1 && yh == 2) || (mh == 2 && yh == 0)) {
    print('相手:${hands[yh]}');
    print("勝ち");
  } else {
    print('相手:${hands[yh]}');
    print("負け");
  }
}







