import 'package:flutter/material.dart';
import 'package:syncit/data/data.dart';
import 'package:syncit/screens/screens.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  query = _controller.text;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YoutubeSearch(
                      query: query,
                    ),
                  ),
                );
              },
              child: Text('Search'),
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
