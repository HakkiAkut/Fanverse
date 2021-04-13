import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/constants/colors.dart';
import 'package:fandom_app/util/constants/dynamic_size.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsMore extends StatefulWidget {
  final News news;

  const NewsMore({Key key, this.news}) : super(key: key);

  @override
  _NewsMoreState createState() => _NewsMoreState();
}

class _NewsMoreState extends State<NewsMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: dynamicWidth(context, 0.65),
                decoration: BoxDecoration(
                  color: mainColor.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.news.url),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.news.title,
                    style: labelText.copyWith(
                        fontSize: 18, color: Colors.black.withOpacity(0.8)),
                  ),
                  Text(
                    DateFormat.yMMMd().format(widget.news.date.toDate()),
                    style: labelText.copyWith(
                        color: Colors.black.withOpacity(0.8)),
                  )
                ],
              ),
              SizedBox(
                height: 18.0,
              ),
              Text(
                widget.news.text,
                style: labelText.copyWith(
                  color: Colors.black.withOpacity(0.9),
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}