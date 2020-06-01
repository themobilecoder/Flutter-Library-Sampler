import 'package:flutter/material.dart';
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
        child: Column(
          children: <Widget>[
            GenericButton(
              child: Text('WidgetFromHtmlCore'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => WidgetFromHtmlScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
