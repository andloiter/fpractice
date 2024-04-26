import 'package:komaru_web/core/riverpod_helper.dart';
import 'package:komaru_web/app/ui_imports.dart';
import 'package:komaru_web/app/rooms/uiroom/ui_standard/ui_standard_widgets/outputs_widget.dart';

// -------------------------------------------------------------------------------------------
// イメージテキストボタン
// -------------------------------------------------------------------------------------------
// ignore: must_be_immutable
class ElevatedTextButtonWidget extends ConsumerWidget {
  ElevatedTextButtonWidget({
    super.key,
    required this.iconWidget,
    required this.width,
    required this.height,
    this.tooltip,
    String? title,
    this.onButtonTap,
    bool enable = true,
  }) {
    _boolEnable = RiverpodHelper<bool>(initValue: enable);
    _labelTitle = TextWidget(
        initValue: title ?? '',
        textStyle: WidgetStyles.bodySmallTextStyle,
        enable: enable,
        maxLines: 1);
  }

  // ------------------------------------------------------------------------------------------------
  // フィールド
  // ------------------------------------------------------------------------------------------------
  // アイコンウジェット
  final Widget iconWidget;
  // 大きさ
  final double? width;
  final double? height;
  // ツールチップ処理
  String? tooltip;
  // タップ処理
  Function? onButtonTap;
  // メッセージ
  late final TextWidget _labelTitle;

  // 有効/無効
  late RiverpodHelper<bool> _boolEnable;
  bool getEnable() => _boolEnable.getValue();
  void setEnable(bool enable) => _boolEnable.updateValue(enable);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 有効/無効
    _boolEnable.createRiverpod(ref);

    Widget displayWidget = _nonTextButton();
    if (_labelTitle.getValue().isNotEmpty) {
      displayWidget = _onTextButton();
    }

    return displayWidget;
  }

  Widget _onTextButton() {
    List<Widget> listElements = [];
    // ボタン
    listElements.add(_elevatedButton());
    // タイトル
    listElements.add(_labelTitle);

    return SizedBox(
        width: width,
        height: height,
        child: FlexGap(
          axis: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: listElements,
        ));
  }

  Widget _nonTextButton() {
    List<Widget> listElements = [];
    // ボタン
    listElements.add(_elevatedButton());

    return SizedBox(
        width: width,
        height: height,
        child: FlexGap(
          axis: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: listElements,
        ));
  }

  Widget _elevatedButton() {
    var button = ElevatedButton(
        onPressed: !getEnable()
            ? null
            : () {
                if (onButtonTap != null) onButtonTap!();
              },
        child: iconWidget,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ));

    if (tooltip != null && tooltip!.isNotEmpty) {
      return Tooltip(message: tooltip, child: button);
    } else {
      return button;
    }
  }
}
