import 'package:flutter/material.dart';
import 'package:wireapps_sneaker_shop/utils/styles/colors/app_colors.dart';

showAlertDialog(
    {required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onNoTapped,
    required VoidCallback onYesTapped}) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text(
      "No",
      style: TextStyle(
        color: AppColors.mineShaft,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
    onPressed: () {
      onNoTapped();
    },
  );

  Widget continueButton = TextButton(
    child: const Text(
      "Yes",
      style: TextStyle(
        color: AppColors.mineShaft,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
    onPressed: () {
      onYesTapped();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      title,
      style: const TextStyle(
        color: AppColors.mineShaft,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    content: Text(
      message,
      style: const TextStyle(
        color: AppColors.mineShaft,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
