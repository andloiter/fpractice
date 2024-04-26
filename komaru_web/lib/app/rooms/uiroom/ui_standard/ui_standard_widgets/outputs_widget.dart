import 'package:komaru_web/core/riverpod_helper.dart';
import 'package:komaru_web/app/ui_imports.dart';

// -------------------------------------------------------------------------------------------
// スクロールテキスト
// -------------------------------------------------------------------------------------------
// ignore: must_be_immutable
class ScrollOutputWidget extends ConsumerWidget {
  ScrollOutputWidget({
    super.key,
    required this.width,
    required this.height,
    required String initValue,
    required this.textStyle,
    bool enable = true,
  }) {
    _stringValue = RiverpodHelper<String>(initValue: initValue);
    _boolEnable = RiverpodHelper<bool>(initValue: enable);
  }

  // ------------------------------------------------------------------------------------------------
  // フィールド
  // ------------------------------------------------------------------------------------------------
  final TextStyle textStyle;
  final double? width;
  final double? height;

  // 設定値
  late RiverpodHelper<String> _stringValue;
  String getValue() => _stringValue.getValue();
  void settValue(String value) => _stringValue.updateValue(value);

  // 有効/無効
  late RiverpodHelper<bool> _boolEnable;
  bool getEnable() => _boolEnable.getValue();
  void setEnable(bool enable) => _boolEnable.updateValue(enable);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 設定値
    _stringValue.createRiverpod(ref);
    // 有効/無効
    _boolEnable.createRiverpod(ref);

    return Container(
      alignment: AlignmentDirectional.centerStart,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: _boolEnable.getValue() ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
          child: Text(getValue(), style: textStyle),
        ),
      ),
    );
  }
}

// -------------------------------------------------------------------------------------------
// テキスト
// -------------------------------------------------------------------------------------------
// ignore: must_be_immutable
class TextWidget extends ConsumerWidget {
  TextWidget(
      {super.key,
      required String initValue,
      required this.textStyle,
      bool enable = true,
      this.maxLines = 1}) {
    _boolEnable = RiverpodHelper<bool>(initValue: enable);
    _stringValue = RiverpodHelper<String>(initValue: initValue);
  }

  // ------------------------------------------------------------------------------------------------
  // フィールド
  // ------------------------------------------------------------------------------------------------
  final TextStyle textStyle;
  final int? maxLines;

  // 有効/無効
  late RiverpodHelper<bool> _boolEnable;
  bool getEnable() => _boolEnable.getValue();
  void setEnable(bool enable) => _boolEnable.updateValue(enable);

  // 設定値
  late RiverpodHelper<String> _stringValue;
  String getValue() => _stringValue.getValue();
  void setValue(String value) => _stringValue.updateValue(value);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 有効/無効
    _boolEnable.createRiverpod(ref);
    // 設定値
    _stringValue.createRiverpod(ref);

    return Text(
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      getValue(),
      style: getEnable()
          ? textStyle
          : TextStyle(
              color: WidgetStyles.invalidColor,
              fontSize: textStyle.fontSize,
              fontWeight: textStyle.fontWeight,
              fontFamily: WidgetStyles.primaryFontName,
              locale: WidgetStyles.primaryLocale,
            ),
    );
  }
}

// -------------------------------------------------------------------------------------------
// コメント
// -------------------------------------------------------------------------------------------
// ignore: must_be_immutable
class CommentWidget extends ConsumerWidget {
  CommentWidget(
      {super.key,
      required String initValue,
      required TextStyle textStyle,
      required this.width,
      required this.height,
      bool enable = true,
      int? maxLines}) {
    _labelMessage = TextWidget(
        initValue: initValue,
        textStyle: textStyle,
        enable: enable,
        maxLines: maxLines);
  }

  // ------------------------------------------------------------------------------------------------
  // フィールド
  // ------------------------------------------------------------------------------------------------
  // 大きさ
  final double? width;
  final double? height;
  // メッセージ
  late final TextWidget _labelMessage;

  // 有効/無効
  bool getEnable() => _labelMessage.getEnable();
  void setEnable(bool enable) => _labelMessage.setEnable(enable);

  // 設定値
  String getValue() => _labelMessage.getValue();
  void setValue(String value) => _labelMessage.setValue(value);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _areaComment();
  }

  Widget _areaComment() {
    return Container(
        width: width,
        height: height,
        decoration: _getBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Align(alignment: Alignment.centerLeft, child: _labelMessage),
        ));
  }

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      // 枠線
      border: Border.all(
        color: Colors.grey,
        width: 3, // 枠線の太さ
      ),
      // 枠線の角丸
      borderRadius: BorderRadius.circular(10),
      // 影
      boxShadow: const [
        BoxShadow(
          color: Colors.black12, // 影の色
          spreadRadius: 1.0, // 影の大きさ
          blurRadius: 10.0, // 影の不透明度
          offset: Offset(5, 5), // x軸、y軸をどれだけずらすか
        )
      ],
    );
  }
}

// -------------------------------------------------------------------------------------------
// ツールチップ
// -------------------------------------------------------------------------------------------
// ignore: must_be_immutable
class ToolTipWidget extends ConsumerWidget {
  ToolTipWidget(
      {super.key, required String initValue, required this.textStyle}) {
    _stringValue = RiverpodHelper<String>(initValue: initValue);
  }

  // ------------------------------------------------------------------------------------------------
  // フィールド
  // ------------------------------------------------------------------------------------------------
  final TextStyle textStyle;

  // 設定値
  late RiverpodHelper<String> _stringValue;
  String getValue() => _stringValue.getValue();
  void setValue(String value) => _stringValue.updateValue(value);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 設定値
    _stringValue.createRiverpod(ref);

    return Tooltip(
      message: getValue(),
      height: 100,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      verticalOffset: 20,
      preferBelow: true,
      textStyle: textStyle,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.all(Radius.circular(100))),
      waitDuration: const Duration(seconds: 3),
      showDuration: const Duration(milliseconds: 1500),
      triggerMode: TooltipTriggerMode.tap,
      enableFeedback: true,
    );
  }
}
