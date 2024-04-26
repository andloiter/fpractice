import 'package:komaru_web/infrastructure/image_helper.dart';
import 'package:komaru_web/app/ui_imports.dart';
import 'package:komaru_web/app/rooms/uiroom/ui_standard/ui_standard_widgets/outputs_widget.dart';

class ForewordAreaWidget extends ConsumerWidget {
  ForewordAreaWidget({
    super.key,
    String initValue = '',
    this.width = 400,
    this.height = 120,
  }) {
    labelForeword = KomaruCommentWidget(
        initValue: initValue,
        textStyle: WidgetStyles.bodyMediumTextStyle,
        width: width,
        height: height);
  }

  late final KomaruCommentWidget labelForeword;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        width: double.infinity,
        height: height + 40.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_getSkyImage()),
            fit: BoxFit.fill,
          ),
        ),
        child: labelForeword);
  }

  String _getSkyImage() {
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
      return IBGroundEnum.heavenSky.path;
    } else if (nowDate.compareTo(noonDate) > -1 &&
        nowDate.compareTo(eveningDate) == -1) {
      return IBGroundEnum.noonSky.path;
    } else if (nowDate.compareTo(eveningDate) > -1 &&
        nowDate.compareTo(nightDate) == -1) {
      return IBGroundEnum.eveningSky.path;
    } else {
      return IBGroundEnum.nightSky.path;
    }
  }
}

class KomaruCommentWidget extends ConsumerWidget {
  KomaruCommentWidget(
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
    return FlexGap(
        axis: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
              alignment: Alignment.topRight,
              clipBehavior: Clip.hardEdge,
              children: [_areaComment(), _areaIcon()])
        ]);
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
      // 枠線
      border: Border.all(
        color: Colors.grey,
        width: 3, // 枠線の太さ
      ),
      // 枠線の角丸
      borderRadius: BorderRadius.circular(10),
      // 影
      // boxShadow: const [
      //   BoxShadow(
      //     color: Colors.black12, // 影の色
      //     spreadRadius: 1.0, // 影の大きさ
      //     blurRadius: 10.0, // 影の不透明度
      //     offset: Offset(5, 5), // x軸、y軸をどれだけずらすか
      //   )
      // ],
    );
  }

  Widget _areaIcon() {
    return SizedBox(
        width: 50, height: 50, child: Image.asset(ImageEnum.komaru.path));
  }
}
