import 'package:flutter/material.dart';

Future showLoader({required BuildContext context}){
  return showDialog(
    
      context: context,
      barrierDismissible: false, // Prevent closing the dialog by tapping outside
      builder: (BuildContext context) {
        return const AlertDialog(
          backgroundColor: Colors.transparent,
          content: Center(
            child: 
                CircularProgressIndicator(
                  color: Colors.green,
                  strokeWidth: 5,
                ),
               
              
            
          ),
        );
      
      });
}