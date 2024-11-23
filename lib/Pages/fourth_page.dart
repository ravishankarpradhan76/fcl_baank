import 'package:flutter/material.dart';

import '../TextStyle.dart';
import '../Widgets/customButton.dart';
import 'Second_page.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 84),
          child: Text('Successfully Saved', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.green,fontSize: 16),),
        ),
        backgroundColor: Colors.green[100],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment App', style: AppTextStyles.header),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green[100],
              ),
              height: 530,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 55),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Text',
                        filled: true,
                        fillColor: Colors.grey[350],
                        border: InputBorder.none,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 180,
                      width: double.infinity,
                      color: Colors.grey[350],
                      child: Center(child: Text('Upload Image', style: AppTextStyles.button)),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    GestureDetector(
                      onTap: _showSuccessMessage,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 13),
                        decoration: BoxDecoration(
                          color: Colors.green[200],
                          border: Border.all(),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
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
