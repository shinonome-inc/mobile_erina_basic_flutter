import 'package:flutter/material.dart';
import 'package:qiita_app/src/constants/app_colors.dart';
import 'package:qiita_app/src/pages/feedpage/feed.dart';
import 'package:qiita_app/src/pages/mypage.dart';
import 'package:qiita_app/src/pages/setting.dart';
import 'package:qiita_app/src/pages/tag.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  // BottomNavigationStateをStatefulWidgetに変更しました
  @override
  State<BottomNavigation> createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  final List<Widget> pageList = [
    const Feed(),
    const Tag(),
    const MyPage(),
    const Setting()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5, color: AppColors.green),
          ),
        ),
        height: 86,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10,
          //文字のサイズ
          unselectedFontSize: 10,
          //選択されていないときの文字
          selectedItemColor: AppColors.lightgreen,
          iconSize: 24,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/feed_icon.png')),
              label: 'フィード',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/tag_icon.png')),
              label: 'タグ',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/mypage_icon.png')),
              label: 'マイページ',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/setting_icon.png')),
              label: '設定',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
