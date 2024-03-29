class ArticleModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;
  String? publishedAt;

  ArticleModel(
      {required this.author,
      required this.title,
      required this.url,
      required this.urlToImage,
      required this.content,
      required this.publishedAt,
      required this.description});
}
