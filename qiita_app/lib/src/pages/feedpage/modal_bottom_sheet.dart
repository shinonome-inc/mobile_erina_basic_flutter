import 'package:flutter/material.dart';
import 'package:qiita_app/src/constants/app_colors.dart';

import '../../constants/app_text_style.dart';

void showAppBottomModalSheet(BuildContext context,
    {required String title, required Widget content}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return AppBottomModalSheet(title: title, content: content);
    },
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
    ),
  );
}

class AppBottomModalSheet extends StatelessWidget {
  final String title;
  final Widget content;
  final bool showBottomDivider;

  const AppBottomModalSheet({
    super.key,
    required this.title,
    required this.content,
    this.showBottomDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      // 初めて描画されるときの高さは画面の90%
      initialChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppBottomModalHeader(
              title: title,
            ),
            if (showBottomDivider)
              const Divider(
                color: AppColors.black,
                thickness: 0.4,
                height: 0.4,
              ),
            Expanded(
              child: content,
            ),
          ],
        );
      },
    );
  }
}

class AppBottomModalHeader extends StatelessWidget {
  final String title;

  const AppBottomModalHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      height: 56,
      decoration: const BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: Text(
        title,
        style: AppTextStyles.apptitle,
      ),
    );
  }
}
