class ViewedNews {
  String title;
  String description;
  String publishedAt;
  String url;
  String content;

  ViewedNews({
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.url,
    required this.content,
  });

  factory ViewedNews.fromMap(Map<String, dynamic> json) => ViewedNews(
        title: json["title"],
        description: json["description"],
        publishedAt: json["publishedAt"],
        url: json["url"],
        content: json["content"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "publishedAt": publishedAt,
        "url": url,
        "content": content,
      };
}
