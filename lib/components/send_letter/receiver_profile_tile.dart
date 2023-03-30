import 'package:daily_carbon/pages/send_letter/receiver_info_page.dart';
import 'package:flutter/material.dart';

class ReceiverProfileTile extends StatelessWidget {
  final String id;
  final String name;
  final String intro;
  final String category;
  final bool isClickable;

  const ReceiverProfileTile({
    required this.id,
    required this.name,
    required this.intro,
    required this.category,
    this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20.0),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
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
                  Text(category, style: TextStyle(fontSize: 12)),
                  SizedBox(height: 5),
                  Container(
                    width: 230,
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 230,
                    child: Text(
                      intro,
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: isClickable
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReceiverInfoPage(
                      postId: id,
                    ),
                  ),
                );
              }
            : () {},
      ),
    );
  }
}
