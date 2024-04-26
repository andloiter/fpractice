import 'package:komaru_web/core/core_imports.dart';
import 'package:komaru_web/infrastructure/infrastructure_imports.dart';
import 'package:komaru_web/app/ui_imports.dart';

import 'package:komaru_web/app/rooms/uiroom/ui_standard/ui_standard_widgets/ui_standard_widget_imports.dart';

class AppPage extends ConsumerStatefulWidget {
  const AppPage({super.key});

  @override
  AppPageState createState() => AppPageState();
}

class AppPageState extends ConsumerState<AppPage> {
  // -------------------------------------------------------------------------------------------
  // 固有処理
  // -------------------------------------------------------------------------------------------
  onTapUiRoom() {
    try {
      // Replaces the entire route stack with the requested path.
      //Routefly.navigate(routePaths.rooms.uiroom.topUi);
      // Adds a new route on top of the existing stack.
      //Routefly.pushNavigate(routePaths.rooms.uiroom.topUi);
      // Adds a route to the route stack.
      Routefly.push(routePaths.rooms.uiroom.topUi);
      // Removes the top route from the route stack.
      //Routefly.pop(context);
      // Replaces the last route in the stack with the requested path.
      //Routefly.replace(routePaths.rooms.uiroom.topUi);
    } on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapUiRoom error. ${e.toString()}', e, s);
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapUiRoom fail. ${e.toString()}', e, s);
    }
  }

  onTapChatRoom() {
    try {} on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapChatRoom error. ${e.toString()}',
          e,
          s);
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapChatRoom fail. ${e.toString()}',
          e,
          s);
    }
  }

  onTapIdeaRoom() {
    try {} on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapIdeaRoom error. ${e.toString()}',
          e,
          s);
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapIdeaRoom fail. ${e.toString()}',
          e,
          s);
    }
  }

  onTapInquiryRoom() {
    try {} on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapInquiryRoom error. ${e.toString()}',
          e,
          s);
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} onTapInquiryRoom fail. ${e.toString()}',
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
    try {
      // ログ
      LoggerHelper.instance.initLogger();
      // 音
      await SoundHelper.instance.initSounds();
    } on Error catch (e, s) {
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
  late final AppPageWidget _pageWidget = AppPageWidget();
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
            child:
                AppBarAreaWidget(titleName: PageEnum.app.title, popIcon: false),
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
                            titleName: PageEnum.app.title,
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

    // コマル修練場
    _pageWidget.buttonUiRoom.onButtonTap = onTapUiRoom;
    // バーコロイター
    _pageWidget.buttonChatRoom.onButtonTap = onTapChatRoom;
    // コマルノート
    _pageWidget.buttonIdeaRoom.onButtonTap = onTapIdeaRoom;
    // コマル問い合わせ
    _pageWidget.buttonInquiryRoom.onButtonTap = onTapInquiryRoom;

    return page;
  }
}

// ignore: must_be_immutable
class AppPageWidget extends ConsumerWidget {
  AppPageWidget({super.key});

  // -------------------------------------------------------------------------------------------
  // 部品
  // -------------------------------------------------------------------------------------------
  late final AppBarAreaWidget areaAppBar =
      AppBarAreaWidget(titleName: PageEnum.app.title, popIcon: false);

  late final ForewordAreaWidget areaForeword = ForewordAreaWidget(
      initValue:
          '${_getGreeting()}コマルです。\nFlutter勉強中です。Web初めてです。\n生暖かく見守ってください。\nデザインって難しい。');

  late final ElevatedTextButtonWidget buttonUiRoom = ElevatedTextButtonWidget(
      title: PUIRoomEnum.uiTop.title,
      tooltip: 'Flutter修練した部屋',
      iconWidget: _openMethodWidget(),
      height: 200,
      width: 200);

  late final ElevatedTextButtonWidget buttonChatRoom = ElevatedTextButtonWidget(
      title: PChatRoomEnum.chatTop.title,
      tooltip: 'チャット部屋',
      iconWidget: _closeMethodWidget(),
      height: 200,
      width: 140);

  late final ElevatedTextButtonWidget buttonIdeaRoom = ElevatedTextButtonWidget(
      title: PIdeaRoomEnum.ideaTop.title,
      tooltip: 'アイデア部屋',
      iconWidget: _closeMethodWidget(),
      height: 200,
      width: 140);

  late final ElevatedTextButtonWidget buttonInquiryRoom =
      ElevatedTextButtonWidget(
          title: PInquiryRoomEnum.inquiryTop.title,
          tooltip: '問い合わせ',
          iconWidget: _closeMethodWidget(),
          height: 200,
          width: 140);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LoggerHelper.instance.logDebug('${runtimeType.toString()} build');
    List<Widget> listElements = [];
    // 前置きエリア
    listElements.add(areaForeword);
    // メソッド群エリア
    listElements.add(_areaMethods());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: PreferredSize(
        //   preferredSize: const Size.fromHeight(WidgetStyles.appBarHeight),
        //   child: areaAppBar,
        // ),
        body: SafeArea(
          top: true,
          child: DefaultTextStyle.merge(
            style: WidgetStyles.primaryTextStyle,
            child: FlexGap(
              axis: Axis.vertical,
              children: listElements,
            ),
          ),
        ));
  }

  String _getGreeting() {
    var nowDate = DateTime.now();

    var heavenDate =
        DateTime(nowDate.year, nowDate.month, nowDate.day, 5, 0, 0);
    var noonDate = DateTime(nowDate.year, nowDate.month, nowDate.day, 8, 0, 0);
    var eveningDate =
        DateTime(nowDate.year, nowDate.month, nowDate.day, 17, 0, 0);
    var nightDate =
        DateTime(nowDate.year, nowDate.month, nowDate.day, 18, 0, 0);

    if (nowDate.compareTo(heavenDate) > -1 &&
        nowDate.compareTo(noonDate) == -1) {
      return 'おはようございます。';
    } else if (nowDate.compareTo(noonDate) > -1 &&
        nowDate.compareTo(eveningDate) == -1) {
      return 'こんにちは。';
    } else if (nowDate.compareTo(eveningDate) > -1 &&
        nowDate.compareTo(nightDate) == -1) {
      return 'こんばんわ。';
    } else {
      return 'お疲れ様です。';
    }
  }

  // メソッド群エリア
  Widget _areaMethods() {
    List<Widget> listElements = [];
    // コマル修練場
    listElements.add(buttonUiRoom);
    // バーコロイター
    listElements.add(buttonChatRoom);
    // コマルノート
    listElements.add(buttonIdeaRoom);
    // コマル問い合わせ
    listElements.add(buttonInquiryRoom);

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(30, 30, 30, 0),
      child: FlexGap(
        axis: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        globalSpace: 20,
        children: listElements,
      ),
    );
  }

  Widget _openMethodWidget() {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Image.asset(IDoorEnum.open.path),
    ]);
  }

  Widget _closeMethodWidget() {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Image.asset(IDoorEnum.close.path),
      Image.asset(ImageEnum.kaigichu.path),
    ]);
  }
}
