import 'package:app_images/core/core.dart';
import 'package:flutter/material.dart';

void showDialogProcess({
  required BuildContext context,
  required String message,
  required VoidCallback onPressed,
}) {
  var delivery = true;
  var rejection = false;
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
                'Proceso de despacho',
                style: TgyStyle.h6.green200.w700,
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        delivery = true;
                        rejection = false;
                        setState(() {});
                      },
                      child: Container(
                        padding: padSy10,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color:
                              delivery ? AppColors.blue200 : AppColors.grey200,
                          borderRadius: BorderRadius.circular(s10),
                        ),
                        child: Text(
                          'Entregrada total.',
                          style: TgyStyle.b1.white,
                        ),
                      ),
                    ),
                    gap8,
                    InkWell(
                      onTap: () {
                        delivery = false;
                        rejection = true;
                        setState(() {});
                      },
                      child: Container(
                        padding: padSy10,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color:
                              rejection ? AppColors.blue200 : AppColors.grey200,
                          borderRadius: BorderRadius.circular(s10),
                        ),
                        child: Text(
                          'Rechazo total.',
                          style: TgyStyle.b1.white,
                        ),
                      ),
                    ),
                    gap8,
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: padSy10,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.ambar100,
                          borderRadius: BorderRadius.circular(s10),
                        ),
                        child: Text(
                          'Rechazo parcial.',
                          style: TgyStyle.b1.black200.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: Container(
                    padding: padSy10,
                    decoration: BoxDecoration(
                      color: AppColors.red200,
                      borderRadius: BorderRadius.circular(s10),
                    ),
                    child: Text('Cancelar', style: TgyStyle.b1.w900.white),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Ok'),
                  child: Container(
                    padding: padSy20.copyWith(top: s10, bottom: s10),
                    decoration: BoxDecoration(
                      color: AppColors.green200,
                      borderRadius: BorderRadius.circular(s10),
                    ),
                    child: Text('Ok', style: TgyStyle.b1.w900.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

void showDialogProcessDocument({
  required BuildContext context,
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
                  'Proceso de documento',
                  style: TgyStyle.h6.green200.w700,
                ),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context, 'remove');
                        },
                        child: Container(
                          padding: padSy10,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: AppColors.blue200,
                            borderRadius: BorderRadius.circular(s10),
                          ),
                          child: Text(
                            'Eliminar producto',
                            style: TgyStyle.b1.white,
                          ),
                        ),
                      ),
                      gap16,
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: padSy10,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: AppColors.blue200,
                            borderRadius: BorderRadius.circular(s10),
                          ),
                          child: Text(
                            'Modificar Cantidad',
                            style: TgyStyle.b1.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: Container(
                      padding: padSy10,
                      decoration: BoxDecoration(
                        color: AppColors.red200,
                        borderRadius: BorderRadius.circular(s10),
                      ),
                      child: Text('Cancelar', style: TgyStyle.b1.w900.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
