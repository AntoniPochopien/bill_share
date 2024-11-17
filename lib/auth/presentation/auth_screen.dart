import 'package:auto_route/auto_route.dart';
import 'package:bill_share/auth/application/cubit/auth_cubit.dart';
import 'package:bill_share/auth/domain/i_auth_repository.dart';
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
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(iAuthRepository: getIt<IAuthRepository>())..init(),
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
                          BillshareTextField(
                            label: 'Username',
                          ),
                          BillshareTextField(
                            label: 'Password',
                            obscure: true,
                          ),
                          Button(text: 'Sign up', onPressed: () {}),
                          DividerWithText(text: 'Or Sign In With'),
                          FramedButton(
                            text: 'Sign in with google',
                            onPressed: () =>
                                context.read<AuthCubit>().googleSignIn(),
                            iconUrl: Assets.googleG,
                          ),
                          FramedButton(text: 'Sign up', onPressed: () {}),
                          FramedButton(text: 'Sign up', onPressed: () {}),
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
