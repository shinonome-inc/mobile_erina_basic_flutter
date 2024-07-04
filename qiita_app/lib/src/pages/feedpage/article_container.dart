import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_style.dart';
import '../../models/article.dart';

//記事小さいやつ
class ArticleContainer extends StatelessWidget {
  const ArticleContainer({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), //余白
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(article.userIconUrl),
                radius: 19,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: AppTextStyles.h2BasicBlack,
                      maxLines: 2, //テキストの表示行数を制限
                      overflow: TextOverflow.ellipsis, //溢れたテキストを省略記号（…）で表示します。
                    ),
                    Text(
                      '@${article.userName} '
                      '投稿日: ${article.postedDate} '
                      'いいね: ${article.likesCount}',
                      style: AppTextStyles.h3BasicSecondary,
                      maxLines: 1, //テキストの表示行数を制限
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    left: 16 +
                        19 * 2 +
                        8), // CircleAvatarの直径と左のPadding、そして間のスペースを加算
                child: const Divider(
                  thickness: 0.5,
                  color: AppColors.secondary,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
