import 'package:fcl_baank/utills/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../utills/app_text_styles.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  bool showText = false; // To control the visibility of the text inside the container

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment App', style: AppTextStyles.header),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green[50],
                ),
                height: 550,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 90),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (showText)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 90),
                          child: Column(
                            children: [
                              Text(
                                'Add at-least a', style: AppTextStyles.body,
                              ),
                              Text(
                                'Widget to save', style: AppTextStyles.body,
                              ),
                            ],
                          ),
                        ),
        
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showText = true; // Show the text when 'Save' is tapped
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                          decoration: BoxDecoration(
                            color: Colors.green.shade300,
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
                Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
