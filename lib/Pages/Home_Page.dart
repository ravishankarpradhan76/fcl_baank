import 'package:fcl_baank/Pages/Second_page.dart';
import 'package:fcl_baank/utills/app_strings.dart';
import 'package:fcl_baank/utills/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../utills/app_text_styles.dart';

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
        title: const Text(
          AppStrings.assignmentApp,
          style: AppTextStyles.header,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green[50],
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.4,
                child: const Center(
                  child: Text(
                    AppStrings.noWidgetAdded,
                    style: AppTextStyles.body,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              CustomButton(
                text: AppStrings.addWidget,
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
      ),
    );
  }
}
