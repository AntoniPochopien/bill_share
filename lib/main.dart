import 'package:bill_share/common/utils/firebase_initialization.dart';
import 'package:bill_share/common/utils/navigator_observers.dart';
import 'package:bill_share/common/utils/supabase_initialization.dart';
import 'package:bill_share/local_storage/domain/i_local_storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/navigation/app_router.dart';

void main() async {
  diInit();
  await Future.wait([
    getIt<ILocalStorageRepository>().init(),
    firebaseInitalization(),
    supabaseInitialization(),
  ]);
  runApp(const BillShare());
}

class BillShare extends StatelessWidget {
  const BillShare({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getIt<AppRouter>().config(
        navigatorObservers: () => navigatorObservers(),
      ),
      title: 'BillShare',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF404040)),
        useMaterial3: true,
      ),
    );
  }
}
