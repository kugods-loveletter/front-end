import 'package:daily_carbon/api/user.dart';
import 'package:flutter/material.dart';

class SentLetterListPage extends StatelessWidget {
  const SentLetterListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15),
            Text("Sent letters"),
            SizedBox(height: 20),
            FutureBuilder<List>(
              future: getUserSentLettersList(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return snapshot.data![index];
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
