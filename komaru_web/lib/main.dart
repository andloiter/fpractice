import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routefly/routefly.dart';

import 'package:komaru_web/core/core_imports.dart';
import 'package:komaru_web/infrastructure/infrastructure_imports.dart';
import 'package:komaru_web/app/styles/theme_styles.dart';
import 'package:komaru_web/routes.dart';

void main() {
  // ブラウザURL
  usePathUrlStrategy();

  runApp(const ProviderScope(child: MainApplication()));
}

class MainApplication extends ConsumerStatefulWidget {
  const MainApplication({super.key});

  @override
  MainApplicationState createState() => MainApplicationState();
}

class MainApplicationState extends ConsumerState<MainApplication> {
  @override
  void initState() {
    LoggerHelper.instance.logDebug('${runtimeType.toString()} initState');
    super.initState();
    try {} on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} initState error. ${e.toString()}', e, s);
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} initState fail. ${e.toString()}', e, s);
    }
  }

  @override
  void dispose() {
    LoggerHelper.instance.logDebug('${runtimeType.toString()} dispose');
    // 音
    SoundHelper.instance.disposeSounds();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LoggerHelper.instance.logDebug('${runtimeType.toString()}: build');

    return MaterialApp.router(
      routerConfig: Routefly.routerConfig(
        routes: routes,
      ),
      title: 'Komaru Flutter',
      theme: ThemeStyles.instance.getLightFlexScheme(),
      darkTheme: ThemeStyles.instance.getDarkFlexScheme(),
    );
  }
}
