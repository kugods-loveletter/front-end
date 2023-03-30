import 'package:daily_carbon/api/user.dart';
import 'package:flutter/material.dart';

class ReceivedLetterListPage extends StatelessWidget {
  const ReceivedLetterListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15),
            Text("Received letters"),
            SizedBox(height: 20),
            FutureBuilder<List>(
              future: getUserReceivedLettersList(),
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
