// -------------------------------------------------------------------------------------------
// ダイアログメッセージ
// -------------------------------------------------------------------------------------------
// 共通
enum CommonMsgEnum {
  // 戻る確認
  queBack('確認', 'メインページに戻りますか？'),
  ;

  const CommonMsgEnum(this.title, this.message);
  final String title;
  final String message;
}

// -------------------------------------------------------------------------------------------
// エリアメッセージ
// -------------------------------------------------------------------------------------------
// 共通
enum CommonAreaMsgEnum {
  // 起動時、再表示時
  initLoad('初期処理中です。お待ちください。'),
  // 確定時
  confirmLaod('確定中です。お待ちください。'),
  // 削除時
  deleteLoad('削除中です。お待ちください。'),
  // 中断時
  interruptLoad('中断中です。お待ちください。'),
  ;

  const CommonAreaMsgEnum(this.message);
  final String message;
}
