import 'package:daily_new/settings.dart';
import 'package:daily_new/utils/data.dart';
import 'package:flutter/material.dart';
import 'model/news.dart';
import 'tiles/tiles.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NewsModel> trends = <NewsModel>[];
  final categories = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];
  int activeTab = 0;
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trends = getTrends();
  }

  void getTrend() {
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Wrap(children: [
          const Text("Daily",
              style: TextStyle(color: Colors.black, fontSize: 21)),
          const Text(
            "News",
            style: TextStyle(color: Colors.red, fontSize: 23),
          ),
        ]),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                loading = false;
              });
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Settings()));
              });
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // Search
              TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  hintText: "Search",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // Categories
              Container(
                height: 40,
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: activeTab == index
                                  ? Colors.blue
                                  : Colors.grey.shade200),
                          child: Center(
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: activeTab == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ))),
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: const Text(
                    "Trending News",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  )),
              // trending
              Container(
                height: 260,
                child: ListView.builder(
                  itemCount: loading ? 2 : trends.length,
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  physics: loading
                      ? const NeverScrollableScrollPhysics()
                      : const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => loading
                      ? const ShimmerTrendTile()
                      : TrendTile(
                          url: trends[index].url,
                          imageUrl: trends[index].urlToImg,
                          title: trends[index].title,
                          time: trends[index].time,
                          author: trends[index].author),
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: const Text(
                    "Recent News",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  )),
              // Recent News
              ListView.builder(
                itemCount: loading ? 3 : trends.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => loading
                    ? const ShimmerRecentTile()
                    : Slidable(
                        secondaryActions: [
                          const IconSlideAction(
                            iconWidget: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            caption: "Delete",
                          )
                        ],
                        actionPane: const SlidableDrawerActionPane(),
                        child: RecentTile(
                            url: trends[index].url,
                            imageUrl: trends[index].urlToImg,
                            title: trends[index].title,
                            time: trends[index].time,
                            author: trends[index].author),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
