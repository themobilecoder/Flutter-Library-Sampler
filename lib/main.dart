import 'package:flutter/material.dart';
import 'package:library_sampler/dart_rss/dart_rss_screen.dart';
import 'package:library_sampler/flutter_widget_from_html_core/widget_from_html_screen.dart';
import 'package:library_sampler/widgets/generic_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Sampler',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Sampler'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GenericButton(
                child: Text('Flutter Widget From Html Core'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => WidgetFromHtmlScreen()));
                },
              ),
              GenericButton(
                child: Text('Dart RSS'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => DartRssScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
