import 'package:flutter/material.dart';
import 'package:syncit/components/components.dart';
import 'package:syncit/screens/screens.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:syncit/data/data.dart';

class YoutubeSearch extends StatefulWidget {
  final String query;

  const YoutubeSearch({Key key, @required this.query}) : super(key: key);

  @override
  _YoutubeSearchState createState() => _YoutubeSearchState();
}

class _YoutubeSearchState extends State<YoutubeSearch> {
  YoutubeAPI ytApi = YoutubeAPI(key);
  List<YT_API> ytResult = [];
  bool isSearched;
  int results;
  String vidUrl;

  callAPI() async {
    String query = widget.query;
    ytResult = await ytApi.search(query);
    ytResult = await ytApi.nextPage();
    results = ytResult.length;
    if (results != 0) {
      setState(() {
        isSearched = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    callAPI();
    isSearched = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isSearched
          ? ListView.builder(
              itemCount: ytResult.length,
              itemBuilder: (_, int index) => listItem(index),
            )
          : Container(
              child: ShimmerEffect(
                length: 10,
              ),
            ),
    );
  }

  Widget listItem(index) {
    return InkWell(
      onTap: () {
        vidUrl = ytResult[index].url;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoScreen(vidUrl: vidUrl)));
        print(vidUrl);
      },
      child: Card(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 7.0),
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              Image.network(
                ytResult[index].thumbnail['default']['url'],
              ),
              Padding(padding: EdgeInsets.only(right: 20.0)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      ytResult[index].title,
                      softWrap: true,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 1.5)),
                    Text(
                      ytResult[index].channelTitle,
                      softWrap: true,
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 3.0)),
                    Text(
                      ytResult[index].url,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
