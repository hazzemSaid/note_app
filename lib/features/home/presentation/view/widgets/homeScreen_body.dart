import 'package:flutter/material.dart';

class HomeScreen_body extends StatelessWidget {
  const HomeScreen_body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        Expanded(
          child: SizedBox(
            width: 350,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return CustomCard(index: index);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final int index;
  const CustomCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title $index',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Description $index',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Date $index + Time $index ',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.favorite),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
