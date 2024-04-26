import 'package:komaru_web/core/core_imports.dart';
import 'package:komaru_web/infrastructure/infrastructure_imports.dart';
import 'package:komaru_web/app/ui_imports.dart';

import 'package:komaru_web/app/rooms/uiroom/ui_standard/ui_standard_widgets/ui_standard_widget_imports.dart';

class UiFluentUiPage extends ConsumerStatefulWidget {
  const UiFluentUiPage({super.key});

  @override
  UiFluentUiPageState createState() => UiFluentUiPageState();
}

class UiFluentUiPageState extends ConsumerState<UiFluentUiPage> {
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
  late final UiFluentUiPageWidget _pageWidget = UiFluentUiPageWidget();
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
                titleName: PUIRoomEnum.uiFluentUi.title, popIcon: false),
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
                            titleName: PUIRoomEnum.uiFluentUi.title,
                            onMessage: _loadProcMessage,
                            onSound: true)),
                  ],
                ),
              )),
        ));
  }

  Widget successPage(bool value) {
    LoggerHelper.instance.logDebug('${runtimeType.toString()}: successPage');

    return PopScope(canPop: false, child: _pageWidget);
  }
}

// ignore: must_be_immutable
class UiFluentUiPageWidget extends ConsumerWidget {
  UiFluentUiPageWidget({super.key});

  // -------------------------------------------------------------------------------------------
  // 部品
  // -------------------------------------------------------------------------------------------
  late final AppBarAreaWidget areaAppBar =
      AppBarAreaWidget(titleName: PUIRoomEnum.uiFluentUi.title, popIcon: false);

  final List<Widget> _listElements = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LoggerHelper.instance.logDebug('${runtimeType.toString()} build');
    // エリア会議中アイコン
    _listElements.add(_areaMakingIcon());

    return PopScope(
        canPop: false,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(WidgetStyles.appBarHeight),
              child: areaAppBar,
            ),
            body: SafeArea(
                top: true,
                child: DefaultTextStyle.merge(
                    style: WidgetStyles.primaryTextStyle,
                    child: Center(
                        child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: FlexGap(
                          axis: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _listElements,
                        ),
                      ),
                    ))))));
  }

  // エリア会議中アイコン
  Widget _areaMakingIcon() {
    return Center(
      child: Image.asset(ImageEnum.kaigichu.path),
    );
  }
}
