import 'package:bill_share/common/utils/firebase_initialization.dart';
import 'package:bill_share/common/utils/navigator_observers.dart';
import 'package:bill_share/common/utils/supabase_initialization.dart';
import 'package:bill_share/l10n/application/cubit/language_cubit.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:bill_share/local_storage/domain/i_local_storage_repository.dart';
import 'package:bill_share/payments/application/cubit/payment_cubit.dart';
import 'package:bill_share/payments/domain/i_payments_repository.dart';
import 'package:flutter/material.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LanguageCubit(
                localStorageRepository: getIt<ILocalStorageRepository>())
              ..init()),
        BlocProvider(create: (context) => PaymentCubit(iPaymentsRepository: getIt<IPaymentsRepository>()))
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, languageState) => MaterialApp.router(
          routerConfig: getIt<AppRouter>().config(
            navigatorObservers: () => navigatorObservers(),
          ),
          title: 'BillShare',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF404040)),
            useMaterial3: true,
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: ZoomPageTransitionsBuilder(
                    allowEnterRouteSnapshotting: false),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
              },
            ),
          ),
          locale: languageState.locale,
          supportedLocales: L10n.supported,
          localizationsDelegates: L10n.localizationDelegates,
        ),
      ),
    );
  }
}
