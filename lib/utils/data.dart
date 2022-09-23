

import '../model/news.dart';

List<NewsModel> getTrends() {
  List<NewsModel> news = <NewsModel>[];

  //1
  NewsModel newsModel = NewsModel(
    author: "BBC",
    title: "Hurricane Ida live updates: Ida may be 1 mph short and who knows it might be.",
    time: "just now",
    urlToImg: "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80",
    url: "https://flutter.dev"
  );
  news.add(newsModel);

  //2
  newsModel = NewsModel(
    author: "Frank",
    title: "Books",
    time: "21 hrs ago",
    urlToImg: "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
    url: "https://developers.google.com/learn"
  );
  news.add(newsModel);

  //3
  newsModel = NewsModel(
      author: "General",
      title: "Entertainment",
      time: "1 min ago",
      urlToImg: "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      url: "https://facebook.com"
  );
  news.add(newsModel);

  return news;
}