import 'package:flutter/material.dart';
import '../TextStyle.dart';
import '../Widgets/customButton.dart';
import 'Third_page.dart';
import 'fourth_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool isTextChecked = true;
  bool isImageChecked = true;
  bool isButtonChecked = true;

  bool get allWidgetsChecked => isTextChecked && isImageChecked && isButtonChecked;
  void _navigateToNextPage() {
    if (isButtonChecked && isTextChecked && isImageChecked) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FourthPage()),
      );
    } else if (isButtonChecked) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ThirdPage()),
      );
    } else {
      // Show a message if not all widgets are selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please check all widgets to proceed.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.green[50],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 135),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: Colors.grey[400],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 80),
                          child: Text('Text Widget', style: AppTextStyles.button),
                        ),
                      ),
                      Positioned(
                        left: 9,
                        top: 11,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isTextChecked = !isTextChecked;
                            });
                          },
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              color: isTextChecked ? Colors.green : Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 70),
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: Colors.grey[400],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 73),
                          child: Text('Image Widget', style: AppTextStyles.button),
                        ),
                      ),
                      Positioned(
                        left: 9,
                        top: 11,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isImageChecked = !isImageChecked;
                            });
                          },
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              color: isImageChecked ? Colors.green : Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 70),
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: Colors.grey[400],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 71),
                          child: Text('Button Widget', style: AppTextStyles.button),
                        ),
                      ),
                      Positioned(
                        left: 9,
                        top: 11,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isButtonChecked = !isButtonChecked;
                            });
                          },
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              color: isButtonChecked ? Colors.green : Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 180),
              CustomButton(
                text: 'Import Widgets',
                onTap: () {
                  // Call navigation function when the button is pressed
                  _navigateToNextPage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
