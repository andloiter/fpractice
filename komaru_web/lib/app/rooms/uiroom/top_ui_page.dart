import 'package:flutter/widgets.dart';
import 'package:komaru_web/core/core_imports.dart';
import 'package:komaru_web/infrastructure/infrastructure_imports.dart';
import 'package:komaru_web/app/ui_imports.dart';

import 'package:komaru_web/app/rooms/uiroom/ui_standard/ui_standard_widgets/ui_standard_widget_imports.dart';

class TopUiPage extends ConsumerStatefulWidget {
  const TopUiPage({super.key});

  @override
  TopUiPageState createState() => TopUiPageState();
}

class TopUiPageState extends ConsumerState<TopUiPage> {
  // -------------------------------------------------------------------------------------------
  // 固有処理
  // -------------------------------------------------------------------------------------------
  onTapUiStandardWidget() {
    try {
      Routefly.push(routePaths.rooms.uiroom.uiStandard.uiStandardWidget);
    } on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapUiStandardWidget error. ${e.toString()}',
          e,
          s);
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapUiStandardWidget fail. ${e.toString()}',
          e,
          s);
    }
  }

  onTapUiStandardFont() {
    try {
      Routefly.push(routePaths.rooms.uiroom.uiStandard.uiStandardFont);
    } on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapUiStandardFont error. ${e.toString()}',
          e,
          s);
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapUiStandardFont fail. ${e.toString()}',
          e,
          s);
    }
  }

  onTapiStandardTheme() {
    try {
      Routefly.push(routePaths.rooms.uiroom.uiStandard.uiStandardTheme);
    } on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapiStandardTheme error. ${e.toString()}',
          e,
          s);
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapiStandardTheme fail. ${e.toString()}',
          e,
          s);
    }
  }

  onTapUiPlutoGrid() {
    try {
      Routefly.push(routePaths.rooms.uiroom.uiPlutoGrid);
    } on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapUiPlutoGrid error. ${e.toString()}',
          e,
          s);
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapUiPlutoGrid fail. ${e.toString()}',
          e,
          s);
    }
  }

  onTapUiFluentUi() {
    try {
      Routefly.push(routePaths.rooms.uiroom.uiFluentUi);
    } on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapUiFluentUi error. ${e.toString()}',
          e,
          s);
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapUiFluentUi fail. ${e.toString()}',
          e,
          s);
    }
  }

  onTapUiOptimus() {
    try {
      Routefly.push(routePaths.rooms.uiroom.uiOptimus);
    } on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapUiOptimus error. ${e.toString()}',
          e,
          s);
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapUiOptimus fail. ${e.toString()}',
          e,
          s);
    }
  }

  onTapUiKatanaForm() {
    try {
      Routefly.push(routePaths.rooms.uiroom.uiKatanaForm);
    } on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapUiKatanaForm error. ${e.toString()}',
          e,
          s);
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapUiKatanaForm fail. ${e.toString()}',
          e,
          s);
    }
  }

  onTapUiMasamuneUniversal() {
    try {
      Routefly.push(routePaths.rooms.uiroom.uiMasamuneUniversalUi);
    } on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapUiMasamuneUniversal error. ${e.toString()}',
          e,
          s);
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapUiMasamuneUniversal fail. ${e.toString()}',
          e,
          s);
    }
  }

  // -------------------------------------------------------------------------------------------
  // 初期処理 画面構築時だけ
  // -------------------------------------------------------------------------------------------
  late FutureProvider<bool> _loadProc;
  String _loadProcMessage = '';
  @override
  void initState() {
    LoggerHelper.instance.logDebug('${runtimeType.toString()} initState');
    super.initState();
    try {
      // load設定
      _loadProc = FutureProvider<bool>((ref) => _initLoad());
      _loadProcMessage = CommonAreaMsgEnum.initLoad.message;
    } on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} initState error. ${e.toString()}', e, s);
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} initState fail. ${e.toString()}', e, s);
    }
  }

  Future<bool> _initLoad() async {
    try {} on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} _initLoad error. ${e.toString()}', e, s);
      return false;
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} _initLoad fail. ${e.toString()}', e, s);
      return false;
    }
    return true;
  }

  // -------------------------------------------------------------------------------------------
  // 画面破棄後
  // -------------------------------------------------------------------------------------------
  @override
  void dispose() {
    LoggerHelper.instance.logDebug('${runtimeType.toString()} dispose');
    super.dispose();
  }

  // ------------------------------------------------------------------------------------------------
  // ウジェット処理
  // ------------------------------------------------------------------------------------------------
  late final TopUiPageWidget _pageWidget = TopUiPageWidget();
  @override
  Widget build(BuildContext context) {
    LoggerHelper.instance.logDebug('${runtimeType.toString()} build');

    switch (ref.watch(_loadProc)) {
      // load終了時
      case AsyncData(:final value):
        var page = successPage(value);
        return page;
      // load中
      case AsyncValue():
        var page = waitPage();
        return page;
    }
  }

  Widget waitPage() {
    LoggerHelper.instance.logDebug('${runtimeType.toString()}: waitPage');

    return PopScope(
        canPop: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(WidgetStyles.appBarHeight),
            child: AppBarAreaWidget(
                titleName: PUIRoomEnum.uiTop.title, popIcon: false),
          ),
          body: SafeArea(
              top: true,
              child: DefaultTextStyle.merge(
                style: WidgetStyles.primaryTextStyle,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: WaitWidget(
                            titleName: PUIRoomEnum.uiTop.title,
                            onMessage: _loadProcMessage,
                            onSound: false)),
                  ],
                ),
              )),
        ));
  }

  Widget successPage(bool value) {
    LoggerHelper.instance.logDebug('${runtimeType.toString()}: successPage');

    var page = PopScope(canPop: false, child: _pageWidget);

    // 標準UI―部品
    _pageWidget.buttonUiStandardWidget.onButtonTap = onTapUiStandardWidget;
    // GoogleFont
    _pageWidget.buttonUiStandardFont.onButtonTap = onTapUiStandardFont;
    // Theme
    _pageWidget.buttonUiStandardTheme.onButtonTap = onTapiStandardTheme;
    // PlutoGrid
    _pageWidget.buttonUiPlutoGrid.onButtonTap = onTapUiPlutoGrid;
    // FluentUi
    _pageWidget.buttonUiFluentUi.onButtonTap = onTapUiFluentUi;
    // Optimus
    _pageWidget.buttonUiOptimus.onButtonTap = onTapUiOptimus;
    // KatanaForm
    _pageWidget.buttonUiKatanaForm.onButtonTap = onTapUiKatanaForm;
    // MasamuneUniversal
    _pageWidget.buttonUiMasamuneUniversal.onButtonTap =
        onTapUiMasamuneUniversal;

    return page;
  }
}

// ignore: must_be_immutable
class TopUiPageWidget extends ConsumerWidget {
  TopUiPageWidget({super.key});

  // -------------------------------------------------------------------------------------------
  // 部品
  // -------------------------------------------------------------------------------------------
  late final AppBarAreaWidget areaAppBar =
      AppBarAreaWidget(titleName: PUIRoomEnum.uiTop.title, popIcon: false);

  late final ForewordAreaWidget areaForeword = ForewordAreaWidget(
      initValue: 'ひとまずやってみたいことを並べてます。\nまだまだ何もできてません。\n2024年04月26日');

  late final ElevatedTextButtonWidget buttonUiStandardWidget =
      ElevatedTextButtonWidget(
          title: PUIRoomEnum.uiStandardWidget.title,
          iconWidget:
              Image.asset(IBookEnum.greenClose.path, fit: BoxFit.contain),
          height: 160,
          width: 120);

  late final ElevatedTextButtonWidget buttonUiStandardFont =
      ElevatedTextButtonWidget(
          title: PUIRoomEnum.uiStandardFont.title,
          iconWidget:
              Image.asset(IBookEnum.greenClose.path, fit: BoxFit.contain),
          height: 160,
          width: 120);

  late final ElevatedTextButtonWidget buttonUiStandardTheme =
      ElevatedTextButtonWidget(
          title: PUIRoomEnum.uiStandardTheme.title,
          iconWidget:
              Image.asset(IBookEnum.greenClose.path, fit: BoxFit.contain),
          height: 160,
          width: 120);

  late final ElevatedTextButtonWidget buttonUiPlutoGrid =
      ElevatedTextButtonWidget(
          title: PUIRoomEnum.uiPlutoGrid.title,
          iconWidget:
              Image.asset(IBookEnum.blueClose.path, fit: BoxFit.contain),
          height: 160,
          width: 120);

  late final ElevatedTextButtonWidget buttonUiFluentUi =
      ElevatedTextButtonWidget(
          title: PUIRoomEnum.uiFluentUi.title,
          iconWidget:
              Image.asset(IBookEnum.orangeClose.path, fit: BoxFit.contain),
          height: 160,
          width: 120);

  late final ElevatedTextButtonWidget buttonUiOptimus =
      ElevatedTextButtonWidget(
          title: PUIRoomEnum.uiOptimus.title,
          iconWidget:
              Image.asset(IBookEnum.orangeClose.path, fit: BoxFit.contain),
          height: 160,
          width: 120);

  late final ElevatedTextButtonWidget buttonUiKatanaForm =
      ElevatedTextButtonWidget(
          title: PUIRoomEnum.uiKatanaForm.title,
          iconWidget: Image.asset(IBookEnum.redClose.path, fit: BoxFit.contain),
          height: 160,
          width: 120);

  late final ElevatedTextButtonWidget buttonUiMasamuneUniversal =
      ElevatedTextButtonWidget(
          title: PUIRoomEnum.uiMasamuneUniversal.title,
          iconWidget: Image.asset(IBookEnum.redClose.path, fit: BoxFit.contain),
          height: 160,
          width: 120);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LoggerHelper.instance.logDebug('${runtimeType.toString()} build');

    List<Widget> listElements = [];
    // 標準UI―部品
    listElements
        .add(_areaMethod(buttonUiStandardWidget, '標準部品(たぶん)を色々集めてやってみました。'));
    // GoogleFont
    listElements.add(_areaMethod(buttonUiStandardFont, 'GoogleFontで遊んでみよう。'));
    // Theme
    listElements.add(_areaMethod(buttonUiStandardTheme, 'Themeって動的に変更できるのかしら'));
    // PlutoGrid
    listElements.add(_areaMethod(buttonUiPlutoGrid, 'この一覧は凄いと思います。'));
    // FluentUi
    listElements.add(_areaMethod(buttonUiFluentUi, '人気があったパッケージなので試してみよう。'));
    // Optimus
    listElements.add(_areaMethod(buttonUiOptimus, 'グラフとかのパッケージぽい。'));
    // KatanaForm
    listElements.add(_areaMethod(buttonUiKatanaForm, '勉強してみよう。'));
    // MasamuneUniversal
    listElements.add(_areaMethod(buttonUiMasamuneUniversal, '同じく勉強してみよう。'));

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(WidgetStyles.appBarHeight),
          child: areaAppBar,
        ),
        body: SafeArea(
            top: true,
            child: DefaultTextStyle.merge(
              style: WidgetStyles.primaryTextStyle,
              child: FlexGap(
                  axis: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  globalSpace: 20,
                  children: [
                    areaForeword,
                    Expanded(
                        child: Scrollbar(
                            child: SingleChildScrollView(
                      child: FlexGap(
                        axis: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        globalSpace: 20,
                        children: listElements,
                      ),
                    )))
                  ]),
            )));
  }

  // メソッド群
  Widget _areaMethod(ElevatedTextButtonWidget button, String comment) {
    List<Widget> listElements = [];
    // ボタン
    listElements.add(button);
    // コメント
    listElements.add(CommentWidget(
        initValue: comment,
        textStyle: WidgetStyles.bodyMediumTextStyle,
        height: 50,
        width: 450));

    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
        child: FlexGap(
          axis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          globalSpace: 20,
          children: listElements,
        ));
  }
}
