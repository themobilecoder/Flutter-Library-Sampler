import 'package:flutter/material.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:http/http.dart' as http;
import 'package:library_sampler/dart_rss/rss_item_container.dart';
import 'package:library_sampler/widgets/generic_loading_spinner.dart';

class DartRssScreen extends StatefulWidget {
  @override
  _DartRssScreenState createState() => _DartRssScreenState();
}

class _DartRssScreenState extends State<DartRssScreen> {
  final client = http.Client();
  final url = 'https://themobilecoder.com/rss';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dart RSS')),
        body: FutureBuilder<RssFeed>(
          future: _getResponseString(url),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final rssFeed = snapshot.data;
              final ads = rssFeed.items;
              return ListView.builder(
                  itemCount: rssFeed.items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: RssItemContainer(
                        title: ads[index].title,
                        subtitle: ads[index].pubDate,
                        imageUrl: _getImageFromDescription(ads[index].description),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text('Error ${snapshot.error}'));
            } else {
              return Center(child: GenericLoadingSpinner());
            }
          },
        ));
  }

  Future<RssFeed> _getResponseString(String url) async {
    final response = await client.get(url);
    final result = RssFeed.parse(response.body);
    return Future.value(result);
  }

  String _getImageFromDescription(String description) {
    final srcTag = 'src=';
    final start = description.indexOf(srcTag) + srcTag.length + 1;
    final end = description.substring(start).indexOf('.png') + 4 + start;
    return description.substring(start, end);
  }
}