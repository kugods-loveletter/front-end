import 'package:flutter/material.dart';

class ReceiverProfileTile extends StatelessWidget {
  const ReceiverProfileTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Material(
        elevation: 4,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.84,
          height: 100,
          child: Row(
            children: [
              SizedBox(width: 20),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Icon(Icons.person),
                ),
              ),
              SizedBox(width: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("이름", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 5),
                  Text("간단한 소개글", style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
