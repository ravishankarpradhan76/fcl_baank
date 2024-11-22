import 'package:flutter/material.dart';

import '../TextStyle.dart';
import '../Widgets/customButton.dart';
import 'Second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment App', style: AppTextStyles.header,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green[100],
              ),
              width: double.infinity,
              height: 560,
              child: Center(
                child: Text(
                  'No widget is added',
                  style: AppTextStyles.body,
                ),
              ),
            ),
            const SizedBox(height: 25),
            CustomButton(
              text: 'Add Widgets',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              },
            ),
          ],
        ),
      ),
      );
  }
}