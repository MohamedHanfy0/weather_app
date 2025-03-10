import 'package:flutter/material.dart';
import 'package:joooooooooooooooo/pages/seach_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Weather App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'There is no weather  start \n searching now',
              style: TextStyle(fontSize: 20, color: Colors.grey[800]),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 250,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => SeachPage()));
                },
                label: Text('Search'),
                icon: Icon(Icons.search, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
