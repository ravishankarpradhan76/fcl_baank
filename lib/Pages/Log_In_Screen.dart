import 'package:flutter/material.dart';

import 'Scan_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  void _navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScanScreen()), // Replace with your next screen
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        leading: Icon(Icons.arrow_back),
      ),
      body: Center(
        // Center the entire Column in the body
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
            children: [
              Stack(
                alignment: Alignment.center, // Center the stack's children
                children: [
                  Container(
                    height: 6,
                    width: 110,
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisSize:
                        MainAxisSize.min, // Use min to avoid taking full width
                    children: [
                      CircleAvatar(
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        radius: 11,
                        backgroundColor: Colors.blue[600],
                      ),
                      SizedBox(width: 25),
                      CircleAvatar(
                        child: Center(
                          child: Text(
                            '2',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                        ),
                        radius: 11,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(width: 25),
                      CircleAvatar(
                        child: Center(
                          child: Text(
                            '3',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                        ),
                        radius: 11,
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                'Lets Create Your Account!',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ' Full Name',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.blueGrey[
                                  50], // Set your desired fill color here
                              filled: true, // Enable the fill color
                              hintText: 'Enter Your Name',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10), // Remove the outline border
                            ),
                          )),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Email Address',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.blueGrey[
                                  50], // Set your desired fill color here
                              filled: true, // Enable the fill color
                              hintText: 'Enter Your email address',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10), // Remove the outline border
                            ),
                          )),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.blueGrey[
                                  50], // Set your desired fill color here
                              filled: true, // Enable the fill color
                              hintText: 'Enter Your Password',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10), // Remove the outline border
                            ),
                          )),
                      SizedBox(
                        height: 19,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: Colors
                                  .transparent, // Set background color if needed
                              borderRadius: BorderRadius.circular(
                                  4), // Set the border radius
                              border: Border.all(
                                color: Colors.blue, // Set the border color
                                width: 2, // Set the border width
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'I agree to the',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Column(
                            children: [
                              Text(
                                'terms',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                              Container(
                                height: 2,
                                width: 30,
                                color: Colors.blue,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            '&',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Column(
                            children: [
                              Text(
                                'conditions',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                              Container(
                                height: 2,
                                width: 53,
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 19,),
                      GestureDetector(
                        onTap: _navigateToNextScreen, // Navigate on tap
                        child: Container(
                          height: 45,
                          width: 320,
                          child: Center(
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 400,
                width: 320,
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Old User?',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
                  SizedBox(width: 3,),
                  Column(
                    children: [
                      Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue),
                      ),
                      Container(
                        height: 2,
                        width: 30,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
