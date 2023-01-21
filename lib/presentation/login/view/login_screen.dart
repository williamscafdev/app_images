import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';
import '../../presentation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (BuildContext screenContext) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (_, LoginViewModel viewModel, __) => Scaffold(
          backgroundColor: AppColors.grey200.withOpacity(0.5),
          body: Form(
            key: viewModel.formKey,
            child: Padding(
              padding: padSy16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ImgGreat(
                    img: ImgA.logo,
                    padding: padSy16,
                  ),
                  gap30,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'login.title'.tr(),
                      style: TgyStyle.h5.green200.w800,
                    ),
                  ),
                  gap16,
                  InputText(
                    controller: viewModel.emailController,
                    minLenght: 3,
                    hint: 'login.user'.tr(),
                  ),
                  gap16,
                  InputPassword(
                    hint: 'login.password'.tr(),
                    passwordController: viewModel.passwordController,
                  ),
                  gap24,
                  Button(
                    label: 'login.button'.tr(),
                    borderRadius: BorderRadius.circular(10),
                    onPressed: () {
                      if (viewModel.formKey.currentState!.validate()) {
                        ProgressDialogo.show(
                          context: context,
                          onLoading: () => viewModel.logIn(),
                          onSuccess: () => context.replace(
                            AppRoutes.routeHome,
                          ),
                          onError: () => _onErrorInformation(
                            context,
                            viewModel.error,
                          ),
                        );
                      } else {
                        _onErrorInformation(
                          context,
                          'login.error.message'.tr(),
                        );
                      }
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

  void _onErrorInformation(
    BuildContext context,
    String error,
  ) =>
      showDialogInformation(
        context: context,
        title: 'login.error.title'.tr(),
        message: error,
        onPressed: () => context.safeNavigatorPop(),
      );
}
