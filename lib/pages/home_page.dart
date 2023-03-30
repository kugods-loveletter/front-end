import 'package:daily_carbon/pages/add_receiver_page.dart';
import 'package:daily_carbon/pages/send_letter/receiver_list_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            _appLogoImage(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "1,105",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.redAccent,
                      ),
                    ),
                    Text(
                      '   LoveLetters were sent',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(243, 193, 193, 1.0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                        child: Text(
                      "Get a     LoveLetter",
                      textAlign: TextAlign.center,
                    )),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddReceiverPage(),
                      ),
                    );
                  },
                ),
                SizedBox(width: 30),
                InkWell(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(243, 193, 193, 1.0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        "Send a LoveLetter",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReceiverListPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _appLogoImage(BuildContext context) {
    return Image(
      image: AssetImage('assets/app_logo.png'),
      fit: BoxFit.contain,
      height: 200,
      width: MediaQuery.of(context).size.width * 0.8,
    );
  }
}
