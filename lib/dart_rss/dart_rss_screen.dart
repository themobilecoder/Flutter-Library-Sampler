import 'package:flutter/material.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:http/http.dart' as http;
import 'package:library_sampler/dart_rss/rss_item_container.dart';
import 'package:library_sampler/widgets/generic_loading_spinner.dart';
import 'package:url_launcher/url_launcher.dart';

class DartRssScreen extends StatelessWidget {
  final client = http.Client();
  final url = 'https://themobilecoder.com/rss';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dart RSS')),
        body: FutureBuilder<RssFeed>(
          future: _getResponseString(url),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final rssFeed = snapshot.data;
              final rssItems = rssFeed.items;
              return ListView.builder(
                  itemCount: rssFeed.items.length,
                  itemBuilder: (context, index) {
                    final rssItem = rssItems[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: RssItemContainer(
                        title: rssItem.title,
                        subtitle: rssItem.pubDate,
                        imageUrl: _getImageFromDescription(rssItem.description),
                        onTapListener: () async {
                          await launch(rssItem.link, forceSafariVC: false);
                        },
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
