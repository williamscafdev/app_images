import 'package:flutter/material.dart';
import 'package:app_images/core/core.dart';

void showDialogInformation({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onPressed,
}) =>
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, StateSetter setState) => WillPopScope(
          onWillPop: () async => false,
          child: Stack(
            children: <Widget>[
              AlertDialog(
                backgroundColor: AppColors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                title: Text(
                  title,
                  style: TgyStyle.h6.ambar300.w700,
                ),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        message,
                        style: TgyStyle.b1.black,
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.ambar300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: onPressed,
                    child: Text(
                      'Aceptar',
                      style: TgyStyle.b1.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

void showDialogInformationSuccess({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onPressed,
}) =>
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, StateSetter setState) => WillPopScope(
          onWillPop: () async => false,
          child: Stack(
            children: <Widget>[
              AlertDialog(
                backgroundColor: AppColors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                title: Text(
                  title,
                  style: TgyStyle.h6.green200.w700,
                ),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        message,
                        style: TgyStyle.b1.black,
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.green200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: onPressed,
                    child: Text(
                      'Aceptar',
                      style: TgyStyle.b1.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
