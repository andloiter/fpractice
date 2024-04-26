import 'package:flutter/material.dart';

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:komaru_web/core/logger_helper.dart';
import 'package:komaru_web/infrastructure/sound_helper.dart';

import 'package:komaru_web/app/styles/widget_styles.dart';

enum DialogTypeEnum {
  // なし
  non,
  // 正常
  success,
  // 情報
  info,
  // 異常
  error,
  // 警告
  warn,
  // 詳細
  detail,
}

// 初期処理中等、処理中にダイアログ表示できない時の確保用クラス
class AftreDialog {
  // -------------------------------------------------------------------------------------------
  // プロパティ
  // -------------------------------------------------------------------------------------------
  // ダイアログ種別
  DialogTypeEnum dialogType = DialogTypeEnum.non;
  // タイトル
  String? title;
  // メッセージ
  String message = '';
  // OKボタン
  Function()? okFunction;
  // 音
  SoundEnum soundType = SoundEnum.poon;

  AftreDialog();

  AftreDialog.init() {
    dialogType = DialogTypeEnum.non;
    title = null;
    message = '';
    okFunction = null;
    soundType = SoundEnum.poon;
  }
}

class DialogShowArgs {
  // 閉じられたフラグ
  bool _closed = false;
  bool getClosed() => _closed;
  // 表示ダイアログ
  AwesomeDialog? showDialog;

  void onDismiss(DismissType type) {
    _closed = true;
  }
}

class DialogShow {
  // -------------------------------------------------------------------------------------------
  // コンストラクタ
  // -------------------------------------------------------------------------------------------
  //Private Constructor
  DialogShow._privateConstructor();
  static final DialogShow instance = DialogShow._privateConstructor();

  void okFunc() {}

  void afterDialog({required context, required AftreDialog dialogArgs}) {
    // なしの場合、即終了
    if (dialogArgs.dialogType == DialogTypeEnum.non) return;

    popDialog(
        type: dialogArgs.dialogType,
        context: context,
        title: dialogArgs.title,
        message: dialogArgs.message,
        okFunction: dialogArgs.okFunction,
        soundType: dialogArgs.soundType);
  }

  void popDialog(
      {required DialogTypeEnum type,
      required context,
      String? title,
      required String message,
      Function()? okFunction,
      SoundEnum soundType = SoundEnum.poon}) {
    switch (type) {
      case DialogTypeEnum.success:
        successDialog(
            context: context,
            title: title,
            message: message,
            okFunction: okFunction,
            soundType: soundType);
        break;
      case DialogTypeEnum.info:
        infoDialog(
            context: context,
            title: title,
            message: message,
            okFunction: okFunction,
            soundType: soundType);
        break;
      case DialogTypeEnum.error:
        errorDialog(
            context: context,
            title: title,
            message: message,
            okFunction: okFunction,
            soundType: soundType);
        break;
      case DialogTypeEnum.warn:
        warnDialog(
            context: context,
            title: title,
            message: message,
            okFunction: okFunction,
            soundType: soundType);
        break;
      case DialogTypeEnum.detail:
        detailDialog(
            context: context,
            title: title,
            message: message,
            okFunction: okFunction,
            soundType: soundType);
        break;
      case DialogTypeEnum.non:
        break;
    }
  }

  static const EdgeInsetsDirectional _paddingMessage =
      EdgeInsetsDirectional.fromSTEB(12, 10, 6, 12);

  // 表示指定されたダイアログ管理
  List<DialogShowArgs> _listDialogs = [];

  bool isActiveDialog() {
    var items = _listDialogs.where((element) => element.getClosed() == false);
    return items.isNotEmpty;
  }

  Future<void> closeDialog() async {
    try {
      // 閉じてないダイアログ検索
      var items = _listDialogs.where((element) => element.getClosed() == false);
      for (var item in items) {
        item.showDialog?.dismiss();
      }
      // 表示指定されたダイアログ管理初期化
      _listDialogs = [];
      // 反映待ち
      await Future.delayed(const Duration(milliseconds: 10));
    } on Error catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} closeDialog error. ${e.toString()}', e, s);
    } on Exception catch (e, s) {
      LoggerHelper.instance.logErrorTrace(
          '${runtimeType.toString()} closeDialog fail. ${e.toString()}', e, s);
    }
  }

  void successDialog(
      {required context,
      String? title,
      required String message,
      Function()? okFunction,
      SoundEnum soundType = SoundEnum.poon}) {
    LoggerHelper.instance
        .logInfo('SuccessDialog title:${title} message:${message}');

    DialogShowArgs args = DialogShowArgs();
    args.showDialog = AwesomeDialog(
      context: context,
      onDismissCallback: args.onDismiss,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      btnOkText: 'OK',
      body: Column(children: [
        Container(
            alignment: Alignment.center,
            child: Text(
              title ?? '正常',
              style: WidgetStyles.dialogTitleTextStyle,
            )),
        Padding(
            padding: _paddingMessage,
            child: Container(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  child: Text(
                    message,
                    style: WidgetStyles.dialogMessageTextStyle,
                  ),
                ))),
      ]),
      btnOkOnPress: okFunction ?? okFunc,
    );

    args.showDialog!.show();
    _listDialogs.add(args);

    if (soundType != SoundEnum.non) {
      SoundHelper.instance.playOneSound(soundType);
    }
  }

  void infoDialog(
      {required context,
      String? title,
      required String message,
      Function()? okFunction,
      SoundEnum soundType = SoundEnum.poon}) {
    LoggerHelper.instance
        .logInfo('InfoDialog title:${title ?? ''} message:${message}');

    DialogShowArgs args = DialogShowArgs();
    args.showDialog = AwesomeDialog(
      context: context,
      onDismissCallback: args.onDismiss,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      btnOkText: 'OK',
      body: Column(children: [
        Container(
            alignment: Alignment.center,
            child: Text(
              title ?? '情報',
              style: WidgetStyles.dialogTitleTextStyle,
            )),
        Padding(
            padding: _paddingMessage,
            child: Container(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  child: Text(
                    message,
                    style: WidgetStyles.dialogMessageTextStyle,
                  ),
                ))),
      ]),
      btnOkOnPress: okFunction ?? okFunc,
    );

    args.showDialog!.show();
    _listDialogs.add(args);

    if (soundType != SoundEnum.non) {
      SoundHelper.instance.playOneSound(soundType);
    }
  }

  void errorDialog(
      {required context,
      String? title,
      required String message,
      Function()? okFunction,
      SoundEnum soundType = SoundEnum.poon}) {
    LoggerHelper.instance
        .logError('ErrorDialog title:${title ?? ''} message:${message}');

    DialogShowArgs args = DialogShowArgs();
    args.showDialog = AwesomeDialog(
      context: context,
      onDismissCallback: args.onDismiss,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      btnOkText: 'OK',
      body: Column(children: [
        Container(
            alignment: Alignment.center,
            child: Text(
              title ?? '異常',
              style: WidgetStyles.dialogTitleTextStyle,
            )),
        Padding(
            padding: _paddingMessage,
            child: Container(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  child: Text(
                    message,
                    style: WidgetStyles.dialogMessageTextStyle,
                  ),
                ))),
      ]),
      btnOkOnPress: okFunction ?? okFunc,
    );

    args.showDialog!.show();
    _listDialogs.add(args);

    if (soundType != SoundEnum.non) {
      SoundHelper.instance.playOneSound(soundType);
    }
  }

  void warnDialog(
      {required context,
      String? title,
      required String message,
      Function()? okFunction,
      SoundEnum soundType = SoundEnum.poon}) {
    LoggerHelper.instance
        .logWarning('WarnDialog title:${title ?? ''} message:${message}');

    DialogShowArgs args = DialogShowArgs();
    args.showDialog = AwesomeDialog(
      context: context,
      onDismissCallback: args.onDismiss,
      dialogType: DialogType.warning,
      animType: AnimType.rightSlide,
      btnOkText: 'OK',
      body: Column(children: [
        Container(
            alignment: Alignment.center,
            child: Text(
              title ?? '警告',
              style: WidgetStyles.dialogTitleTextStyle,
            )),
        Padding(
            padding: _paddingMessage,
            child: Container(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  child: Text(
                    message,
                    style: WidgetStyles.dialogMessageTextStyle,
                  ),
                ))),
      ]),
      btnOkOnPress: okFunction ?? okFunc,
    );

    args.showDialog!.show();
    _listDialogs.add(args);

    if (soundType != SoundEnum.non) {
      SoundHelper.instance.playOneSound(soundType);
    }
  }

  void questionDialog(
      {required context,
      String? title,
      required String message,
      required Function okFunction,
      required Function cancelFunction,
      SoundEnum soundType = SoundEnum.poon}) {
    LoggerHelper.instance
        .logDebug('questionDialog title:${title ?? ''} message:${message}');

    DialogShowArgs args = DialogShowArgs();
    args.showDialog = AwesomeDialog(
      context: context,
      onDismissCallback: args.onDismiss,
      dialogType: DialogType.question,
      animType: AnimType.rightSlide,
      btnCancelText: 'キャンセル',
      btnOkText: 'OK',
      body: Column(children: [
        Container(
            alignment: Alignment.center,
            child: Text(
              title ?? '確認',
              style: WidgetStyles.dialogTitleTextStyle,
            )),
        Padding(
            padding: _paddingMessage,
            child: Container(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  child: Text(
                    message,
                    style: WidgetStyles.dialogMessageTextStyle,
                  ),
                ))),
      ]),
      btnCancelOnPress: () => cancelFunction(),
      btnOkOnPress: () => okFunction(),
    );

    args.showDialog!.show();
    _listDialogs.add(args);

    if (soundType != SoundEnum.non) {
      SoundHelper.instance.playOneSound(soundType);
    }
  }

  void detailDialog(
      {required context,
      String? title,
      required String message,
      Function()? okFunction,
      SoundEnum soundType = SoundEnum.poon}) {
    LoggerHelper.instance
        .logDebug('detailDialog title:${title ?? ''} message:${message}');

    DialogShowArgs args = DialogShowArgs();
    args.showDialog = AwesomeDialog(
      context: context,
      onDismissCallback: args.onDismiss,
      titleTextStyle: WidgetStyles.bodyMediumTextStyle,
      dialogType: DialogType.noHeader,
      title: title,
      btnOkText: 'OK',
      body: Column(children: [
        Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Container(
                      child: Text(
                    title ?? '詳細',
                    style: WidgetStyles.dialogTitleTextStyle,
                  ))),
              IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    args.showDialog!.dismiss();
                    if (okFunction != null) {
                      okFunction();
                    }
                  }),
            ]),
        Padding(
            padding: _paddingMessage,
            child: Container(
              //height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                //borderRadius: BorderRadius.circular(4),
                border: Border(
                  top: BorderSide(
                    color: Color(0xFF616161),
                    width: 3,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(6, 10, 0, 6),
                  child: Text(
                    message,
                    style: WidgetStyles.dialogMessageTextStyle,
                  ),
                ),
              ),
            )),
      ]),
    );

    args.showDialog!.show();
    _listDialogs.add(args);

    if (soundType != SoundEnum.non) {
      SoundHelper.instance.playOneSound(soundType);
    }
  }
}
