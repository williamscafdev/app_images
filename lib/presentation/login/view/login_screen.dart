import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:app_images/core/core.dart';
import 'package:app_images/presentation/presentation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (BuildContext screenContext) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (_, LoginViewModel viewModel, __) => Scaffold(
          body: SafeArea(
            child: Form(
              key: viewModel.formKey,
              child: Padding(
                padding: padSy16,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImgGreat(
                      path: ImgA.logo.path,
                      padding: padSy16,
                    ),
                    gap30,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Bienvenido',
                        style: TgyStyle.h5.green200.w800,
                      ),
                    ),
                    gap16,
                    InputText(
                      controller: viewModel.emailController,
                      minLenght: 6,
                      suffixText: Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          top: 16,
                          bottom: 16,
                        ),
                        child: Text(
                          '@bigwelta.com',
                          style: TgyStyle.b1.green200.w700,
                        ),
                      ),
                      hint: 'Usuario',
                    ),
                    gap16,
                    InputPassword(
                      passwordController: viewModel.passwordController,
                    ),
                    gap24,
                    Button(
                      label: 'Ingresar',
                      onPressed: () {
                        if (viewModel.formKey.currentState!.validate()) {
                          ProgressDialogo.show(
                            context: context,
                            onLoading: () async {
                              await viewModel.logIn();
                            },
                            onSuccess: () {
                              context.replace(
                                AppRoutes.routeHome,
                              );
                            },
                            onError: () =>
                                _onErrorInformation(context, viewModel),
                          );
                        }
                      },
                    ),
                    gap24,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onErrorInformation(
    BuildContext context,
    LoginViewModel viewModel,
  ) =>
      showDialogInformation(
        context: context,
        title: 'Información del servidor',
        message: viewModel.error,
        onPressed: () => context.safeNavigatorPop(),
      );
}
