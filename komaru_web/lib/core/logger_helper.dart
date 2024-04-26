import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:roggle/roggle.dart';

class LoggerHelper {
  // -------------------------------------------------------------------------------------------
  // フィールド
  // -------------------------------------------------------------------------------------------
  static final DateFormat _dateF = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');

  Roggle? _logger;

  // -------------------------------------------------------------------------------------------
  // コンストラクタ
  // -------------------------------------------------------------------------------------------
  //Private Constructor
  LoggerHelper._privateConstructor();
  static final LoggerHelper instance = LoggerHelper._privateConstructor();

  bool getRelease() {
    var isRelease = true;
    assert(
      () {
        isRelease = false;
        return true;
      }(),
    );
    return isRelease;
  }

  void initLogger() {
    try {
      _logger = getRelease()
          ? Roggle.crashlytics(
              printer: CrashlyticsPrinter(
                errorLevel: Level.error,
                onError: (event) {
                  // Send an error to Firebase Crashlytics as follows

                  // FirebaseCrashlytics.instance.recordError(
                  //   event.exception,
                  //   event.stack,
                  //   fatal: true,
                  // );

                  log('FirebaseCrashlytics.exception: ${event.exception}');
                  event.stack
                      .toString()
                      .split('\n')
                      .where((line) => line.isNotEmpty)
                      .forEach((line) {
                    log('FirebaseCrashlytics.stack: $line');
                  });
                },
                // ignore: unnecessary_lambdas
                onLog: (event) {
                  // Send logs to Firebase Crashlytics as follows

                  // FirebaseCrashlytics.instance.log(event.message);

                  log('FirebaseCrashlytics.log: ${event.message}');
                },
                loggerName: 'komaru_web',
              ),
            )
          : Roggle(
              printer: SinglePrettyPrinter(
                loggerName: 'komaru_web',
                stackTraceLevel: Level.error,
              ),
            );
    } on Error catch (e) {
      log('${runtimeType.toString()} initLogger error. ${e.toString()}');
    } on Exception catch (e) {
      log('${runtimeType.toString()} initLogger fail. ${e.toString()}');
    }
  }

  void logDebug(String message) {
    try {
      if (_logger == null) {
        log('${_dateF.format(DateTime.now())} $message');
      } else {
        _logger!.d('${_dateF.format(DateTime.now())} $message');
      }
    } on Error catch (e) {
      log('${runtimeType.toString()} logDebug error. ${e.toString()}');
    } on Exception catch (e) {
      log('${runtimeType.toString()} logDebug fail. ${e.toString()}');
    }
  }

  void logInfo(String message) {
    try {
      if (_logger == null) {
        log('${_dateF.format(DateTime.now())} $message');
      } else {
        _logger!.i('${_dateF.format(DateTime.now())} $message');
      }
    } on Error catch (e) {
      log('${runtimeType.toString()} logInfo error. ${e.toString()}');
    } on Exception catch (e) {
      log('${runtimeType.toString()} logInfo fail. ${e.toString()}');
    }
  }

  void logWarning(String message) {
    try {
      if (_logger == null) {
        log('${_dateF.format(DateTime.now())} $message');
      } else {
        _logger!.w('${_dateF.format(DateTime.now())} $message');
      }
    } on Error catch (e) {
      log('${runtimeType.toString()} logWarning error. ${e.toString()}');
    } on Exception catch (e) {
      log('${runtimeType.toString()} logWarning fail. ${e.toString()}');
    }
  }

  void logError(String message) {
    try {
      if (_logger == null) {
        log('${_dateF.format(DateTime.now())} $message');
      } else {
        _logger!.e('${_dateF.format(DateTime.now())} $message');
      }
    } on Error catch (e) {
      log('${runtimeType.toString()} logError error. ${e.toString()}');
    } on Exception catch (e) {
      log('${runtimeType.toString()} logError fail. ${e.toString()}');
    }
  }

  void logErrorTrace(String message, Object e, StackTrace s) {
    try {
      if (_logger == null) {
        log('${_dateF.format(DateTime.now())} $message');
      } else {
        _logger!.f('${_dateF.format(DateTime.now())} $message',
            error: e, stackTrace: s);
      }
    } on Error catch (e) {
      log('${runtimeType.toString()} logErrorTrace error. ${e.toString()}');
    } on Exception catch (e) {
      log('${runtimeType.toString()} logErrorTrace fail. ${e.toString()}');
    }
  }
}
