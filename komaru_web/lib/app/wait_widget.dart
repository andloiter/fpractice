import 'package:komaru_web/core/core_imports.dart';
import 'package:komaru_web/infrastructure/infrastructure_imports.dart';
import 'package:komaru_web/app/ui_imports.dart';

import 'package:komaru_web/app/rooms/uiroom/ui_standard/ui_standard_widgets/ui_standard_widget_imports.dart';

// ignore: must_be_immutable
class WaitWidget extends ConsumerStatefulWidget {
  WaitWidget({
    super.key,
    required this.titleName,
    this.onImagePath,
    this.onMessage,
    this.onSound = false,
  });

  final String titleName;
  String? onImagePath;
  String? onMessage;
  bool onSound;

  @override
  WaitWidgetState createState() => WaitWidgetState();
}

class WaitWidgetState extends ConsumerState<WaitWidget> {
  // -------------------------------------------------------------------------------------------
  // 部品
  // -------------------------------------------------------------------------------------------
  late final TextWidget _labelMessage = TextWidget(
      initValue: widget.onMessage ?? 'お待ちください。',
      textStyle: WidgetStyles.bodyLargeTextStyle);

  // -------------------------------------------------------------------------------------------
  // 初期処理 画面構築時だけ
  // -------------------------------------------------------------------------------------------
  @override
  void initState() {
    LoggerHelper.instance.logDebug('${runtimeType.toString()} initState');
    super.initState();
    try {
      // アニメーションの場合
    } on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} initState error. ${e.toString()}', e, s);
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} initState fail. ${e.toString()}', e, s);
    }
  }

  // -------------------------------------------------------------------------------------------
  // 画面破棄後
  // -------------------------------------------------------------------------------------------
  @override
  void dispose() {
    LoggerHelper.instance.logDebug('${runtimeType.toString()} dispose');
    // アニメーションの場合
    super.dispose();
  }

  // ------------------------------------------------------------------------------------------------
  // ウジェット処理
  // ------------------------------------------------------------------------------------------------
  List<Widget> _listElements = [];
  @override
  Widget build(BuildContext context) {
    LoggerHelper.instance.logDebug('${runtimeType.toString()} build');

    // エリアお待ちアイコン
    _listElements.add(_areaWaitIcon());
    // エリアお待ちメッセージ
    _listElements.add(_areaWaitMessage());
    // 音鳴らす
    if (widget.onSound) {
      SoundHelper.instance.playOneSound(SoundEnum.jingle);
    }

    return Center(
        child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FlexGap(
          axis: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          globalSpace: 20,
          children: _listElements,
        ),
      ),
    ));
  }

  // エリアお待ちアイコン
  Widget _areaWaitIcon() {
    return Center(
      child: Image.asset(widget.onImagePath ?? ImageEnum.ramen.path),
    );
  }

  // エリアお待ちメッセージ
  Widget _areaWaitMessage() {
    return _labelMessage;
  }
}
