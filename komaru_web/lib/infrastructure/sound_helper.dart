import 'dart:async';

import 'package:flutter/services.dart';
import 'package:synchronized/synchronized.dart';
import 'package:soundpool/soundpool.dart';
import 'package:flutter_sound/flutter_sound.dart';

import 'package:komaru_web/core/logger_helper.dart';

// 音定義
enum SoundEnum {
  // 音なし
  non(''),
  // ピイン
  pin('assets/sounds/maou_s_13.wav'),
  // ピロ
  pilo('assets/sounds/maou_s_23.wav'),
  // ピブ
  pibu('assets/sounds/maou_s_32.wav'),
  // ピイーン
  piin('assets/sounds/maou_s_37.wav'),
  // ポーン
  poon('assets/sounds/maou_se_8bit08.wav'),
  // ジングルベル
  jingle('assets/sounds/maou_se_jingle03.wav'),
  // ピコン
  pikon('assets/sounds/maou_se_onepoint26.wav'),
  // 遠い呼び出し
  call('assets/sounds/maou_se_system40.wav'),
  // カーン
  kaan('assets/sounds/maou_se_system46.wav'),
  ;

  const SoundEnum(this.path);
  final String path;
}

class SoundHelper {
  // -------------------------------------------------------------------------------------------
  // コンストラクタ
  // -------------------------------------------------------------------------------------------
  //Private Constructor
  SoundHelper._privateConstructor();
  static final SoundHelper instance = SoundHelper._privateConstructor();

  // プレイヤー
  final Soundpool _pool = Soundpool.fromOptions();
  // 音管理
  final Map<SoundEnum, int> _sounds = {};
  // 音ロック
  final _lockSound = Lock(reentrant: true);

  // 初期処理
  Future<void> initSounds() async {
    await _lockSound.synchronized(() async {
      try {
        for (var item in SoundEnum.values) {
          if (item.path.isEmpty) continue;
          var id = await rootBundle.load(item.path).then((ByteData soundData) {
            return _pool.load(soundData);
          });
          _sounds[item] = id;
        }
        LoggerHelper.instance.logDebug('${runtimeType.toString()} initSounds');
      } on Error catch (e, s) {
        LoggerHelper.instance.logErrorTrace(
            '${runtimeType.toString()} initSounds error. ${e.toString()}',
            e,
            s);
      } on Exception catch (e, s) {
        LoggerHelper.instance.logErrorTrace(
            '${runtimeType.toString()} initSounds fail. ${e.toString()}', e, s);
      }
    });
  }

  // 破棄処理
  Future<void> disposeSounds() async {
    await _lockSound.synchronized(() async {
      try {} on Error catch (e, s) {
        LoggerHelper.instance.logErrorTrace(
            '${runtimeType.toString()} disposeSounds error. ${e.toString()}',
            e,
            s);
      } on Exception catch (e, s) {
        LoggerHelper.instance.logErrorTrace(
            '${runtimeType.toString()} disposeSounds fail. ${e.toString()}',
            e,
            s);
      }
    });
  }

  // 音鳴らす
  // 1タップ1音など連続呼びでもバーコードなど余裕がある場合はこちら
  Future<void> playOneSound(SoundEnum type) async {
    await _lockSound.synchronized(() async {
      try {
        if (_sounds.containsKey(type)) {
          LoggerHelper.instance
              .logDebug('${runtimeType.toString()} playOneSound');
          await _pool.play(_sounds[type]!);
        }
      } on Error catch (e, s) {
        LoggerHelper.instance.logErrorTrace(
            '${runtimeType.toString()} PlayOneSound error. ${e.toString()}',
            e,
            s);
      } on Exception catch (e, s) {
        LoggerHelper.instance.logErrorTrace(
            '${runtimeType.toString()} PlayOneSound fail. ${e.toString()}',
            e,
            s);
      }
    });
  }
}

class SoundRecordHelper {
  // -------------------------------------------------------------------------------------------
  // コンストラクタ
  // -------------------------------------------------------------------------------------------
  //Private Constructor
  SoundRecordHelper._privateConstructor();
  static final SoundRecordHelper instance =
      SoundRecordHelper._privateConstructor();

  // プレイヤー
  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  // 音管理
  final Map<SoundEnum, Uint8List> _sounds = {};
  // 音ロック
  final _lockSound = Lock(reentrant: true);

  // 初期処理
  Future<void> initSounds() async {
    await _lockSound.synchronized(() async {
      try {
        await _player.openPlayer();
        for (var item in SoundEnum.values) {
          if (item.path.isEmpty) continue;
          _sounds[item] = FlutterSoundHelper().waveToPCMBuffer(
            inputBuffer: await _getAssetData(item.path),
          );
        }
        await _player.startPlayerFromStream(
          codec: Codec.pcm16,
          numChannels: 44100,
          sampleRate: 1,
        );
      } on Error catch (e, s) {
        LoggerHelper.instance.logErrorTrace(
            '${runtimeType.toString()} initSounds error. ${e.toString()}',
            e,
            s);
      } on Exception catch (e, s) {
        LoggerHelper.instance.logErrorTrace(
            '${runtimeType.toString()} initSounds fail. ${e.toString()}', e, s);
      }
    });
  }

  Future<Uint8List> _getAssetData(String path) async {
    var asset = await rootBundle.load(path);
    return asset.buffer.asUint8List();
  }

  // 破棄処理
  Future<void> disposeSounds() async {
    await _lockSound.synchronized(() async {
      try {
        await _player.stopPlayer();
        await _player.closePlayer();
      } on Error catch (e, s) {
        LoggerHelper.instance.logErrorTrace(
            '${runtimeType.toString()} disposeSounds error. ${e.toString()}',
            e,
            s);
      } on Exception catch (e, s) {
        LoggerHelper.instance.logErrorTrace(
            '${runtimeType.toString()} disposeSounds fail. ${e.toString()}',
            e,
            s);
      }
    });
  }

  // 音鳴らす
  // 1タップ1音など連続呼びでもバーコードなど余裕がある場合はこちら
  Future<void> playOneSound(SoundEnum type) async {
    await _lockSound.synchronized(() async {
      try {
        if (_sounds.containsKey(type)) {
          await _player.feedFromStream(_sounds[type]!);
        }
      } on Error catch (e, s) {
        LoggerHelper.instance.logErrorTrace(
            '${runtimeType.toString()} PlayOneSound error. ${e.toString()}',
            e,
            s);
      } on Exception catch (e, s) {
        LoggerHelper.instance.logErrorTrace(
            '${runtimeType.toString()} PlayOneSound fail. ${e.toString()}',
            e,
            s);
      }
    });
  }
}
