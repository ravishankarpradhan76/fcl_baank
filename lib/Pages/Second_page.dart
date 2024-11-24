import 'package:fcl_baank/utills/app_strings.dart';
import 'package:flutter/material.dart';
import '../utills/app_text_styles.dart';
import '../utills/common_widgets/custom_button.dart';
import 'third_page.dart';
import 'fourth_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool isTextChecked = false;
  bool isImageChecked = false;
  bool isButtonChecked = false;

  bool get allWidgetsChecked =>
      isTextChecked && isImageChecked && isButtonChecked;
  void _navigateToNextPage() {
    if (allWidgetsChecked) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  FourthPage()),
      );
    } else if (isButtonChecked && !isImageChecked && !isTextChecked) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ThirdPage()),
      );
    } else {
      // Show a message if not all widgets are selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please check valid widgets to proceed.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 50.0, vertical: 100.0),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.green[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _card(
                      title: AppStrings.textWidget,
                      isChecked: isTextChecked,
                      onTapCard: () {
                        setState(() {
                          isTextChecked = !isTextChecked;
                        });
                      }),
                  const SizedBox(height: 30),
                  _card(
                      title: AppStrings.imageWidget,
                      isChecked: isImageChecked,
                      onTapCard: () {
                        setState(() {
                          isImageChecked = !isImageChecked;
                        });
                      }),
                  const SizedBox(height: 30),
                  _card(
                      title: AppStrings.buttonWidget,
                      isChecked: isButtonChecked,
                      onTapCard: () {
                        setState(() {
                          isButtonChecked = !isButtonChecked;
                        });
                      }),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: AppStrings.saveButton,
                    onTap: () {
                      _navigateToNextPage();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _card({String? title, Function()? onTapCard, bool? isChecked}) {
    return GestureDetector(
        onTap: () {
          if (onTapCard != null) {
            onTapCard();
          }
        },
        child: Stack(
          children: [
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width / 1 - 100,
              color: Colors.grey[300],
              child:
                  Center(child: Text(title ?? '', style: AppTextStyles.button)),
            ),
            Positioned(
              child: Container(
                height: 45,
                width: 45,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: isChecked == true
                          ? Colors.green
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
