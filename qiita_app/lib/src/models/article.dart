import 'package:intl/intl.dart'; //日付フォーマット機能をインポート

class Article {
  //記事のプロパティを定義
  final String title;
  final String userIconUrl;
  final String userName;
  final String postedDate;
  final int likesCount;
  final String url;

  //コンストラクタ（テストなどで直接オブジェクトを作成する場合に使用）
  Article({
    required this.title,
    required this.userIconUrl,
    required this.userName,
    required this.postedDate,
    required this.likesCount,
    required this.url,
  });

  // JSONデータからArticleオブジェクトを作成するファクトリーコンストラクタ
  factory Article.fromJson(Map<String, dynamic> json) {
    final DateFormat formatter = DateFormat('yyyy/MM/dd');
    final DateTime dateTime = DateTime.parse(json['created_at']);
    final String formattedDate = formatter.format(dateTime);
    //抽出したデータを使用してArticleオブジェクトを作成
    return Article(
      title: json['title'] as String,
      userIconUrl: json['user']['profile_image_url'],
      userName: json['user']['id'] as String,
      postedDate: formattedDate,
      likesCount: json['likes_count'] ?? 0,
      url: json['url'] as String,
    );
  }
}
