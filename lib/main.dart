import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';
import 'backend/firebase/firebase_config.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

// ✅ SERVICES
import 'services/supplier_service.dart';
import 'services/simulation_result_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  await initFirebase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SupplierService()..loadSuppliers()),

        ChangeNotifierProvider(
          create: (_) => SimulationResultService(),
        ),
      ],
      child: MyApp(),
    ),
  );

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class MyAppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  late Stream<BaseAuthUser> userStream;

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);

    userStream = supplyAssistFirebaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });

    jwtTokenStream.listen((_) {});

    Future.delayed(
      const Duration(milliseconds: 1000),
          () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  /// ✅ REQUIRED BY FLUTTERFLOW
  String getRoute() {
    final route = _router.routerDelegate.currentConfiguration;
    return route.uri.toString();
  }

  /// ✅ REQUIRED BY FLUTTERFLOW
  List<String> getRouteStack() {
    final matches = _router.routerDelegate.currentConfiguration.matches;
    return matches.map((e) => e.matchedLocation).toList();
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
    _themeMode = mode;
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// 🔥 Supplier base data
        ChangeNotifierProvider(
          create: (_) => SupplierService(),
        ),

        /// 🧪 Simulation results (used by DisruptionImpact)
        ChangeNotifierProvider(
          create: (_) => SimulationResultService(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Supply Assist',
        scrollBehavior: MyAppScrollBehavior(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en')],
        theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: false,
        ),
        themeMode: _themeMode,
        routerConfig: _router,
      ),
    );
  }
}
