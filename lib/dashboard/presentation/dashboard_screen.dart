import 'package:auto_route/auto_route.dart';
import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:bill_share/di.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BillshareScaffold(
      body: Column(
        children: [
          Button(
              text: 'Log out',
              onPressed: () async => await getIt<IAuthRepository>().logOut())
        ],
      ),
    );
  }
}
