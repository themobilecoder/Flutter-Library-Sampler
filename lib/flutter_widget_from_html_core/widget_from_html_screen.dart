import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:library_sampler/flutter_widget_from_html_core/sample_html_string.dart';

class WidgetFromHtmlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget from HTML Core'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: HtmlWidget(
            kSampleHtmlString,
          ),
        ),
      ),
    );
  }
}
