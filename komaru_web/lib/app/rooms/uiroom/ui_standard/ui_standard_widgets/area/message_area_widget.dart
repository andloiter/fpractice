import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:komaru_web/core/riverpod_helper.dart';
import 'package:komaru_web/app/styles/widget_styles.dart';

// ignore: must_be_immutable
class MessageAreaWidget extends ConsumerWidget {
  MessageAreaWidget({
    super.key,
    String initValue = '',
  }) {
    _stringMessage = RiverpodHelper<String>(initValue: initValue);
  }

  // メッセージ
  late RiverpodHelper<String> _stringMessage;
  String getMessage() => _stringMessage.getValue();
  void setMessage(String message) => _stringMessage.updateValue(message);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // メッセージ
    _stringMessage.createRiverpod(ref);

    return Container(
      height: 40,
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFF616161),
            width: 3,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
          child: Text(
            _stringMessage.getValue(),
            style: WidgetStyles.bodyMediumTextStyle,
          ),
        ),
      ),
    );
  }
}
