import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final int index;
  CustomCard({
    super.key,
    required this.index,
  });
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.brown,
    Colors.grey,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: colors[index % 10],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                'Flutter Tips',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Build a Flutter app that uses the following features:',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            Text('25th may 2021',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ));
  }
}
