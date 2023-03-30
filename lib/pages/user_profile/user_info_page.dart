import 'package:daily_carbon/api/user.dart';
import 'package:daily_carbon/pages/auth/login_page.dart';
import 'package:daily_carbon/pages/user_profile/received_letter_list_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'sent_letter_list_page.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 80),
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                FutureBuilder<Response>(
                  future: getOneUser(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      final user = snapshot.data.data['data'][0];
                      return Container(
                        width: 280,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                "My info",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 24),
                              Text(
                                "ID:  ${user['id']}",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Email:  ${user['email']}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                Positioned(
                  top: -50,
                  left: 90,
                  child: Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Icon(Icons.perm_identity, size: 40),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            _buildSentLetterButton(context),
            SizedBox(height: 15),
            _buildReceivedLetterButton(context),
            Spacer(),
            _buildLogoutButton(context),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSentLetterButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.email),
              SizedBox(width: 20),
              Text("Sent letters"),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SentLetterListPage()),
          );
        },
      ),
    );
  }

  Widget _buildReceivedLetterButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.email),
              SizedBox(width: 20),
              Text("Received letters"),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReceivedLetterListPage()),
          );
        },
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
      child: Text("Logout"),
    );
  }
}
