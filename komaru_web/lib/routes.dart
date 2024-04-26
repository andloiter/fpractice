import 'package:routefly/routefly.dart';

import 'app/app_page.dart' as a0;
import 'app/rooms/uiroom/top_ui_page.dart' as a8;
import 'app/rooms/uiroom/ui_fluent_ui/ui_fluent_ui_page.dart' as a9;
import 'app/rooms/uiroom/ui_katana_form/ui_katana_form_page.dart' as a10;
import 'app/rooms/uiroom/ui_masamune_universal_ui/ui_masamune_universal_ui_page.dart' as a11;
import 'app/rooms/uiroom/ui_optimus/ui_optimus_page.dart' as a12;
import 'app/rooms/uiroom/ui_pluto_grid/ui_pluto_grid_page.dart' as a13;
import 'app/rooms/uiroom/ui_standard/ui_standard_font_page.dart' as a14;
import 'app/rooms/uiroom/ui_standard/ui_standard_theme_page.dart' as a15;
import 'app/rooms/uiroom/ui_standard/ui_standard_widget_page.dart' as a16;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/',
    uri: Uri.parse('/'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.AppPage(),
    ),
  ),
  RouteEntity(
    key: '/rooms/uiroom/top_ui',
    uri: Uri.parse('/rooms/uiroom/top_ui'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a8.TopUiPage(),
    ),
  ),
  RouteEntity(
    key: '/rooms/uiroom/ui_fluent_ui',
    uri: Uri.parse('/rooms/uiroom/ui_fluent_ui'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a9.UiFluentUiPage(),
    ),
  ),
  RouteEntity(
    key: '/rooms/uiroom/ui_katana_form',
    uri: Uri.parse('/rooms/uiroom/ui_katana_form'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a10.UiKatanaFormPage(),
    ),
  ),
  RouteEntity(
    key: '/rooms/uiroom/ui_masamune_universal_ui',
    uri: Uri.parse('/rooms/uiroom/ui_masamune_universal_ui'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a11.UiMasamuneUniversalUiPage(),
    ),
  ),
  RouteEntity(
    key: '/rooms/uiroom/ui_optimus',
    uri: Uri.parse('/rooms/uiroom/ui_optimus'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a12.UiOptimusPage(),
    ),
  ),
  RouteEntity(
    key: '/rooms/uiroom/ui_pluto_grid',
    uri: Uri.parse('/rooms/uiroom/ui_pluto_grid'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a13.UiPlutoGridPage(),
    ),
  ),
  RouteEntity(
    key: '/rooms/uiroom/ui_standard/ui_standard_font',
    uri: Uri.parse('/rooms/uiroom/ui_standard/ui_standard_font'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a14.UiStandardFontPage(),
    ),
  ),
  RouteEntity(
    key: '/rooms/uiroom/ui_standard/ui_standard_theme',
    uri: Uri.parse('/rooms/uiroom/ui_standard/ui_standard_theme'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a15.UiStandardThemePage(),
    ),
  ),
  RouteEntity(
    key: '/rooms/uiroom/ui_standard/ui_standard_widget',
    uri: Uri.parse('/rooms/uiroom/ui_standard/ui_standard_widget'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a16.UiStandardWidgetPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  rooms: (
    path: '/rooms',
    uiroom: (
      path: '/rooms/uiroom',
      topUi: '/rooms/uiroom/top_ui',
      uiFluentUi: '/rooms/uiroom/ui_fluent_ui',
      uiKatanaForm: '/rooms/uiroom/ui_katana_form',
      uiMasamuneUniversalUi: '/rooms/uiroom/ui_masamune_universal_ui',
      uiOptimus: '/rooms/uiroom/ui_optimus',
      uiPlutoGrid: '/rooms/uiroom/ui_pluto_grid',
      uiStandard: (
        path: '/rooms/uiroom/ui_standard',
        uiStandardFont: '/rooms/uiroom/ui_standard/ui_standard_font',
        uiStandardTheme: '/rooms/uiroom/ui_standard/ui_standard_theme',
        uiStandardWidget: '/rooms/uiroom/ui_standard/ui_standard_widget',
      ),
    ),
  ),
);
