import 'package:flutter/material.dart';

class RssItemContainer extends StatelessWidget {
  RssItemContainer({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.imageUrl,
    @required this.onTapListener,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String imageUrl;
  final Function onTapListener;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTapListener,
        child: Row(
          children: <Widget>[
            Image.network(
              imageUrl,
              height: 64,
              width: 64,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Wrap(
                alignment: WrapAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.caption,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
