import 'package:auto_route/auto_route.dart';
import 'package:bill_share/auth/application/cubit/auth_cubit.dart';
import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/auth/presentation/widgets/expand_and_fade/expand_and_fade_controller.dart';
import 'package:bill_share/auth/presentation/widgets/expand_and_fade/expand_and_fade_widget.dart';
import 'package:bill_share/common/utils/error_handler.dart';
import 'package:bill_share/common/utils/validators.dart';
import 'package:bill_share/constants/assets.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:bill_share/auth/presentation/widgets/divider_with_text.dart';
import 'package:bill_share/common/widgets/billshare_text_field.dart';
import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/widgets/framed_button.dart';
import 'package:bill_share/common/widgets/logo.dart';
import 'package:bill_share/common/widgets/privacy_policy_info.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:bill_share/constants/font.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _inputsExpandAndFadeControllers =
      List.generate(2, (index) => ExpandAndFadeController());
  final _buttonsExpandAndFadeController =
      List.generate(2, (index) => ExpandAndFadeController());
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final pwdController = TextEditingController();
  final repeatPwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _signUpWithEmail = false;

  void _loginRegisterSwitcher() {
    for (final controller in _inputsExpandAndFadeControllers) {
      if (_signUpWithEmail) {
        controller.collapse();
      } else {
        controller.expand();
      }
    }
    for (final controller in _buttonsExpandAndFadeController) {
      if (_signUpWithEmail) {
        controller.expand();
      } else {
        controller.collapse();
      }
    }
    setState(() {
      _signUpWithEmail = !_signUpWithEmail;
    });
  }

  void _onSignIn(BuildContext context) {
    if (_signUpWithEmail) {
      if (_formKey.currentState!.validate()) {
        context.read<AuthCubit>().signUpWithEmail(
            email: emailController.text,
            username: usernameController.text,
            password: pwdController.text);
      }
    } else {
      context.read<AuthCubit>().signInWithEmail(
          email: emailController.text, password: pwdController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        iAuthRepository: getIt<IAuthRepository>(),
        injectableUser: getIt<InjectableUser>(),
      )..init(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
              authenticated: (user) => context.replaceRoute(HomeRoute()),
              error: (failure) =>
                  ErrorHandler.showErrorDialog(context, failure: failure));
        },
        builder: (context, state) => BillshareScaffold(
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: SafeArea(
                  child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Logo(
                            size: 87,
                          ),
                          Column(children: [
                            Text(
                              'Sign In',
                              style: Font.h2DarkSemiBold,
                            ),
                            Text(
                              'Access to your account',
                              style: Font.h4Grey,
                            ),
                          ]),
                          Column(children: [
                            BillshareTextField(
                              controller: emailController,
                              label: 'Email',
                              validator: (v) =>
                                  Validators.emailValidator(context, v),
                            ),
                            ExpandAndFadeWidget(
                                controller: _inputsExpandAndFadeControllers[0],
                                child: BillshareTextField(
                                    controller: usernameController,
                                    label: 'Username',
                                    validator: (v) {
                                      if (_signUpWithEmail) {
                                        return Validators.usernameValidator(
                                            context, v);
                                      } else {
                                        return null;
                                      }
                                    })),
                            BillshareTextField(
                              controller: pwdController,
                              label: 'Password',
                              obscure: true,
                              validator: (v) =>
                                  Validators.passwordValidator(context, v),
                            ),
                            ExpandAndFadeWidget(
                              controller: _inputsExpandAndFadeControllers[1],
                              child: BillshareTextField(
                                controller: repeatPwdController,
                                label: 'Repeat password',
                                obscure: true,
                                validator: (v) {
                                  if (_signUpWithEmail) {
                                    return Validators.repeatPasswordValidator(
                                        context, v, pwdController.text);
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Button(
                                isLoading: state.maybeWhen(
                                    orElse: () => false, loading: () => true),
                                text: _signUpWithEmail ? 'Sign Up' : 'Sign in',
                                onPressed: () => _onSignIn(context)),
                            DividerWithText(text: 'Or Sign In With'),
                            ExpandAndFadeWidget(
                              controller: _buttonsExpandAndFadeController[0],
                              initialExpanded: true,
                              child: FramedButton(
                                text: 'Sign in with google',
                                onPressed: () =>
                                    context.read<AuthCubit>().googleSignIn(),
                                iconUrl: Assets.googleG,
                              ),
                            ),
                            ExpandAndFadeWidget(
                                controller: _buttonsExpandAndFadeController[1],
                                initialExpanded: true,
                                child: FramedButton(
                                  text: 'Sign in with Apple',
                                  onPressed: () {},
                                  iconUrl: Assets.apple,
                                )),
                            AnimatedSwitcher(
                              duration: Duration(milliseconds: 300),
                              child: _signUpWithEmail
                                  ? FramedButton(
                                      key: ValueKey('Already have an account'),
                                      text: 'Already have an account',
                                      onPressed: () => _loginRegisterSwitcher(),
                                    )
                                  : FramedButton(
                                      key: ValueKey('Sign up with Email'),
                                      text: 'Sign up with Email',
                                      iconData: Icons.email,
                                      onPressed: () =>
                                          _loginRegisterSwitcher()),
                            ),
                          ]),
                          PrivacyPolicyInfo(),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
