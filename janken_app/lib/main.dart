import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String myHand = '✊';
  String yourHands = '✊';
  String result = '';

  void selectHand(String selectedHand) {
    myHand = selectedHand; // myHand に 引数として受けとった selectedHand を代入します。
    print(myHand);
    yourHand(); // コンピューターの手を決める。
    judge();
    setState(() {});
  }

  void yourHand() {
    final randomNumber = Random().nextInt(3);
    // 生成されたランダムな数字を ✊, ✌️, 🖐 に変換して、コンピューターの手に代入します。
    yourHands = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    // () のなかには条件となる値を書きます。
    switch (randomNumber) {
      case 0: // 入ってきた値がもし 0 だったら。
        return '✊'; // ✊を返す。
      case 1: // 入ってきた値がもし 1 だったら。
        return '✌️'; // ✌️を返す。
      case 2: // 入ってきた値がもし 2 だったら。
        return '🖐'; // 🖐を返す。
      default: // 上で書いてきた以外の値が入ってきたら。
        return '✊'; // ✊を返す。（0, 1, 2 以外が入ることはないが念のため）
    }
  }

  void judge() {
    if (myHand == yourHands) {
      result = '引き分け';
    } else if ((myHand == '✊' && yourHands == '✌️') ||
        (myHand == '✌️' && yourHands == '🖐️') ||
        (myHand == '🖐️' && yourHands == '✊')) {
      result = '勝ち';
    } else {
      result = '負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('じゃんけん'),
      ),
      body: Center(
        //ボタン
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 48),
            Text(
              yourHands,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            // 余白を追加
            const SizedBox(height: 48),
            Text(
              myHand,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(110, 100), // ボタンの幅と高さを指定
                  ),
                  onPressed: () {
                    selectHand('✊');
                  },
                  child: const Text(
                      '✊',
                      style: TextStyle(fontSize: 32),
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(110, 100), // ボタンの幅と高さを指定
                  ),
                  onPressed: () {
                    selectHand('✌️');
                  },
                  child: const Text(
                      '✌️',
                      style: TextStyle(fontSize: 32),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(110, 100), // ボタンの幅と高さを指定
                  ),
                  onPressed: () {
                    selectHand('🖐️');
                  },
                  child: const Text(
                      '🖐️',
                      style: TextStyle(fontSize: 32),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
