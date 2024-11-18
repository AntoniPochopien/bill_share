import 'package:auto_route/auto_route.dart';
import 'package:bill_share/auth/application/cubit/auth_cubit.dart';
import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/auth/presentation/widgets/expand_and_fade/expand_and_fade_controller.dart';
import 'package:bill_share/auth/presentation/widgets/expand_and_fade/expand_and_fade_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthCubit(iAuthRepository: getIt<IAuthRepository>())..init(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            authenticated: (user) => context.replaceRoute(DashboardRoute()),
          );
        },
        builder: (context, state) => BillshareScaffold(
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: SafeArea(
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
                          ExpandAndFadeWidget(
                            controller: _inputsExpandAndFadeControllers[0],
                            child: BillshareTextField(
                              label: 'Email',
                            ),
                          ),
                          BillshareTextField(
                            label: 'Username',
                          ),
                          BillshareTextField(
                            label: 'Password',
                            obscure: true,
                          ),
                          ExpandAndFadeWidget(
                            controller: _inputsExpandAndFadeControllers[1],
                            child: BillshareTextField(
                              label: 'Repeat password',
                            ),
                          ),
                          Button(
                              text: _signUpWithEmail ? 'Sign Up' : 'Sign in',
                              onPressed: () {}),
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
                                    text: 'Already have an account',
                                    onPressed: () => _loginRegisterSwitcher(),
                                  )
                                : FramedButton(
                                    text: 'Sign up with Email',
                                    iconData: Icons.email,
                                    onPressed: () => _loginRegisterSwitcher()),
                          ),
                        ]),
                        PrivacyPolicyInfo(),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
