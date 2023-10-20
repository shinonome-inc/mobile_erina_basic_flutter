import 'dart:io';
import 'dart:math' as math;

void main(List<String> arguments) {
  int yh = math.Random().nextInt(3);

  print("じゃんけんの手を入力してください（グーなら１、チョキなら２、パーなら３のキーボード)");
  String input = stdin.readLineSync() ?? '';
  int mh = int.parse(input);

  if(mh == yh) {
    print("あいこ");
  }else if((mh == 1&& yh == 2)||(mh == 2 && yh == 3)||(mh == 3 && yh == 1)) {
    print("勝ち");
  }else {
    print("負け");
  }
}





