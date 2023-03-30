import 'package:daily_carbon/pages/send_letter/letter_detail_view_page.dart';
import 'package:flutter/material.dart';

class CustomLetterTile extends StatelessWidget {
  final String id;
  final String title;
  final String body;

  const CustomLetterTile({
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          children: [
            SizedBox(width: 30),
            Icon(Icons.chat_bubble_outline_rounded, size: 30),
            SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 250,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  width: 250,
                  child: Text(
                    body,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LetterDetailViewPage(id: id),
          ),
        );
      },
    );
  }
}
